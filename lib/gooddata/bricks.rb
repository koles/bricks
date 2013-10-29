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


FileUtils::cd "lib" do
  Dir.glob('gooddata/bricks/user/*.rb').each {|p| require p}
  Dir.glob('gooddata/bricks/middleware/*.rb').each {|p| require p}
end
