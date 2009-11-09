require File.dirname(__FILE__) + "/vendor/gems/environment"
require 'sinatra'
require 'JSON'
require 'rhino'

get "/" do
  erb :index
end

post "/eval" do
  Rhino::Context.open_std do |cxt, scope|
    JSON.pretty_generate(cxt.eval(params[:source] || '', scope))
  end
end