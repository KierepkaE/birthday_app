require 'sinatra/base'
require 'sinatra'
require 'capybara/dsl'
require 'selenium-webdriver'
class Birthday < Sinatra::Base

 enable :sessions

  get '/' do
    erb :index
  end

  post '/date' do
    session[:birthday_date] = params[:birthday_date]
    session[:name] = params[:name]
    redirect '/birthday'
  end

  get '/birthday' do
    @today_date = Date.today
    @birthday_date = session[:birthday_date]
    @days = (DateTime.now.mjd - DateTime.parse(@birthday_date).mjd) < 0 ? (DateTime.now.mjd - DateTime.parse(@birthday_date).mjd) * -1 : (DateTime.now.mjd - DateTime.parse(@birthday_date).mjd)
    @name = session[:name]

    if (@today_date.to_s).slice(5..9) ==(@birthday_date.to_s).slice(5..9)
      erb :birthday
    else
      erb :counting_to_birthday
    end
  end

  run! if app_file == $0

  set :session_secret, 'super secret'

end
