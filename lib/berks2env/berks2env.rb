require "berkshelf"
require "chef/environment"

if ARGV.length != 2
  puts "Usage: berks2env <version/branch> <berkslock>"
  exit 1
end

if ARGV[0] =~ /\d+\.\d+\.\d+/ # This will pickup both 1.2.3 and 1.2.3-alpha.1
  branch = ARGV[0]
else
  branch = ARGV[0].gsub(/[\-;:,.\/\\"']/,"_")
end

environment = Chef::Environment.new
environment.name(branch.gsub(".","_"))
berksfile = Berkshelf::Lockfile.from_file(ARGV[1])
locks = berksfile.graph.locks.inject({}) do |hash, (name, dependency)|
  hash[name] = "= #{dependency.locked_version.to_s}"
  hash
end
environment.cookbook_versions(locks)

environment.override_attributes({ :server_env => { :version => { :real => branch, :virt => branch }}})
envfile = File.open("#{branch.gsub(".","_")}.json", "w")
envfile.write(environment.to_json)
envfile.close


# Create the major.minor.X environment to go with the major.minor.patch environment
# only if this is a X.Y.Z release not an X.Y.Z-beta.N or -alpha.N or a branch name
if ARGV[0].match(/\d+\.\d+\.\d+\z/)
  # Work out my major.minor.X version
  xver = ARGV[0].split(".")
  xver = "#{xver[0]}.#{xver[1]}.LATEST"
  # Create the major.minor.X environment to go with the major.minor.patch environment
  environment.name(xver.gsub(".", "_"))
  environment.override_attributes({ :server_env => { :version => { :real => branch, :virt => xver }}})
  envfile = File.open("#{xver.gsub(".", "_")}.json", "w")
  envfile.write(environment.to_json)
  envfile.close
end
