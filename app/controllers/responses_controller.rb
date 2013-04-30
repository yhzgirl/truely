class ResponsesController < ApplicationController

  before_filter :authorized, only: [:new, :create]

  respond_to :html, :json

  def new
    @response = Response.new
    @question = Question.random_question
  end

  def create
    # This is where we create the current_users response to the question asked
    @response = Response.new(params[:response])
    if @response.save
      flash[:notice] = "Your response was recorded"
      respond_with(@response)
    else
      flash[:error] = "Something went wrong, please try again"
      render :new
    end
  end
end
