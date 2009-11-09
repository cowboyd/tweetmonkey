require 'sinatra'
require 'JSON'
require 'twitter'
require 'rhino'

get "/" do
  erb :index
end

post "/eval" do
    Rhino::Context.open_std do |cxt, scope|
      scope['monkey'] = TweetMonkey.new(params[:username], params[:password])
      JSON.pretty_generate begin
        cxt.eval(params[:source], scope)
      rescue StandardError => e
        {:error => e.message}
      end
    end
end

class TweetMonkey
  def initialize(u, p)
    Twitter::HTTPAuth.new(u,p).tap do |auth|
      @client = Twitter::Base.new(auth)
    end
  end

  def friends
    @client.friends
  end

  def followers
    @client.followers
  end

  def friends_timeline
    @client.friends_timeline
  end

  def user_timeline
    @client.user_timeline
  end

  def replies
    @client.replies
  end

  def search(query = nil, options = {})

    Twitter::Search.new(query).tap do |s|
      for field,value in options
        s.send(field, value) if s.respond_to?(field)
      end
    end.fetch
  end
end