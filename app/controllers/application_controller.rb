class ApplicationController < ActionController::Base
  protect_from_forgery

	include MySQL_SP 
end
