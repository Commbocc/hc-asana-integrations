class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def zap_basic_auth
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV["BASIC_AUTH_NAME"] && password == ENV["BASIC_AUTH_PASS"]
    end
  end
  
end
