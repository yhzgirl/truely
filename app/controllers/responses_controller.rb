class ResponsesController < ApplicationController

  before_filter :authorized, only: [:new, :create]

  respond_to :html, :json

  def new
    @response = Response.new

  end

  def create
    # This is where we create the current_users response to the question asked
    @response = Response.new(params[:user_question_response])
    if @response.save
      flash[:notice] = "Your response was added"
      respond_with(@response)
    else
      flash[:error] = "Something went wrong, please try again"
      render :new
    end
  end
end
