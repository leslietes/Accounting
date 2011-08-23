class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthenticatedSystem
  
  protected
  
  def login_required
    if !current_user
      redirect_to root_url
    else
      return true
    end
  end
end
