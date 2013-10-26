require 'linkedin'

class LoginController < ApplicationController
  
  API_KEY = 'em7a2uvkyb9u' #Your app's API key
  API_SECRET = 'ttemnMXrM9uCA0s8' #Your app's API secret
  REDIRECT_URI = 'http://localhost:3000/accept' #Redirect user after authentication to this path, ensure that you have set up your routes to handle the callbacks
  STATE = SecureRandom.hex(15) #A unique long string that is not easy to guess
  
  def index
    # get your api keys at https://www.linkedin.com/secure/developer
    client = LinkedIn::Client.new(API_KEY, API_SECRET)
    request_token = client.request_token(:oauth_callback => "http://#{request.host_with_port}/accept")
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret

    redirect_to client.request_token.authorize_url

  end

  def accept
    client = LinkedIn::Client.new(API_KEY, API_SECRET)
    if session[:atoken].nil?
      pin = params[:oauth_verifier]
      atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
      session[:atoken] = atoken
      session[:asecret] = asecret
    else
      client.authorize_from_access(session[:atoken], session[:asecret])
    end
    @profile = client.profile
    @positions = client.profile(:fields => %w(positions)).positions
    @companies = @positions.all.map{|t| t.company.name}
    @industries = @positions.all.map{|t| t.company.industry}
    @latest_industry = @industries.first


  end

end