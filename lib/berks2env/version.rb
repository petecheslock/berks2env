# encoding: utf-8

# This module holds the Berks2Env version info
module Berks2Env
  VERSION = IO.read(File.join(File.dirname(__FILE__), '..', '..', 'VERSION')) rescue "0.0.1"
end
