class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery 

  include SessionsHelper    # NEW LINE
  WillPaginate.per_page = 6

end
