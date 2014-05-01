require 'berks2env/version'

require 'berkshelf'
require 'chef/environment'

# This class takes and dumps out environment json files
class Convert
  attr_reader :branch, :berkslockfile

  def initialize(branch, berkslockfile)
    @branch = branch
    @berkslockfile = berkslockfile
    @environment = Chef::Environment.new
  end

  def run
    clean_branch = self.sanitize_branch
    @environment.name(clean_branch)
    berksfile = Berkshelf::Lockfile.from_file(@berkslockfile)
    locks = berksfile.graph.locks.inject({}) do |hash, (name, dependency)|
      hash[name] = "= #{dependency.locked_version.to_s}"
      hash
    end
    @environment.cookbook_versions(locks)

    @environment.override_attributes({ :server_env => { :version => { :real => @branch, :virt => @branch }}})
    envfile = File.open("#{clean_branch}.json", 'w')
    envfile.write(@environment.to_json)
    envfile.close
    self.create_latest
  end

  def create_latest
    if @branch.match(/\d+\.\d+\.\d+\z/)
      xver = @branch.split('.')
      xver = "#{xver[0]}.#{xver[1]}.LATEST"
      # Create the major.minor.X environment to go with the major.minor.patch environment
      @environment.name(xver.gsub('.', '_'))
      @environment.override_attributes({ :server_env => { :version => { :real => @branch, :virt => xver }}})
      envfile = File.open("#{xver.gsub('.', '_')}.json", 'w')
      envfile.write(@environment.to_json)
      envfile.close
    end
  end


  def sanitize_branch
    if self.branch =~ /\d+\.\d+\.\d+/
      self.branch.gsub('.','_')
    else
      self.branch.gsub(/[\-;:,.\/\\']/,'_')
    end
  end

end
