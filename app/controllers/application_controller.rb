class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  require 'open-uri'
  def get_weather
  	return JSON.load(open("https://www.metaweather.com/api/location/1103816/"))["consolidated_weather"][0]["the_temp"]
    end

end
