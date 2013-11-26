require 'sinatra/base'
require_relative 'models/init'
require_relative 'routes/init'

class BluePages< Sinatra::Base
  #  enable :method_override

  configure do
    set :app_file, __FILE__
    enable :logging
    file = File.new("#{settings.root}/logs/#{settings.environment}.log", 'a+')
    file.sync = true
    use Rack::CommonLogger, file
  end

  configure :development do
    enable :dump_errors, :raise_errors
  end

  configure :test do
    enable :dump_errors, :raise_errors
  end

  configure :production do
    set :raise_errors, false #false will show nicer error page
    set :show_exceptions, false #true will ignore raise_errors and display backtrace in browser
  end

  register Sinatra::Companies
end
