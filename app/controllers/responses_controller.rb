class ResponsesController < ApplicationController

  before_filter :authorized, only: [:new, :create]

  def new
    @response = Response.build
  end

  def create
    # This is where we create the current_users response to the question asked
    
  end
end
