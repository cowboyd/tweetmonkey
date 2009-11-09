require File.dirname(__FILE__) + "/vendor/gems/environment"
require 'sinatra'
require 'JSON'
require 'rhino'

get "/" do
  erb :index
end

get "/eval" do
  JSON.pretty_generate({
    :foo => 'bar',
    :baz => {
      :number => 5,
      :boolean => true,
      :floater => 3.14
    }
  })
end