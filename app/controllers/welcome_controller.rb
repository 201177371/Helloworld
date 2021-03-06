class WelcomeController < ApplicationController 
 	 
     rescue_from Exception, :with => :render_error
     rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
     rescue_from ActionController::RoutingError, :with => :render_not_found
     rescue_from ActionController::UnknownController, :with => :render_not_found
     rescue_from ActionController::UnknownAction, :with => :render_not_found

 def index
 raise Exception.new("server down")
 #raise ActiveRecord::RecordNotFound.new("Page not found")
 #raise ActionController::RoutingError.new("Routing encountered an error")
 end

private
 
  def render_not_found(exception)
     render :template => "/error/404.html.erb", :status => 404
   end
 
  def render_error(exception)
     render :template => "/error/500.html.erb", :status => 500
   end

end
