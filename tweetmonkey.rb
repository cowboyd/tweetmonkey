require File.dirname(__FILE__) + "/vendor/gems/environment"
require 'sinatra'
use Rack::Reloader
require File.dirname(__FILE__) + '/lib/server'
