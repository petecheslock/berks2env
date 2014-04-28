berks2env
=========

Convert a Berkshelf Lockfile to a Chef Environment json

With Berks3 - ```berks apply``` is an awesome feature - but doesn't work if you want to create a net new environment (via your CI system)

What this does is allows you to pass in a branch or version number (or any arbitrary data really) and a Berksfile.lock and convert them
into a Chef server supported envrionment json.

TODO
========
Currently this is the raw, original version of the script we use to create environment files per our workflow
that was discussed at ChefConf 2014 - You can watch this talk here.

https://www.youtube.com/watch?v=L__8o02od6Q

Use [this link](http://youtu.be/L__8o02od6Q?t=21m16s) to jump directly to the section I talk about Jenkins/CI workflows


* Going to eventually convert this into a rubygem, and maybe even propose as a feature update to Berks3
* Going to support another command option to injest json into the resultant environment json
* General cleanup and refactor to make it more flexible.
* This is raw and has only a single specific use case - Watch my talk if you want
more info about how and why this is used.
