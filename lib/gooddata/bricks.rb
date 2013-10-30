require "gooddata/bricks/version"
require 'bundler/setup'

require 'pp'
require 'json'
require 'pry'
require 'fileutils'
require 'restclient'
require 'benchmark'

require 'gooddata'
require 'logger'

require "gooddata/bricks/brick"
require 'pathname'


Gem.find_files("gooddata/bricks/middleware/*.rb").each { |path| require path }
Gem.find_files("gooddata/bricks/user/*.rb").each { |path| require path }