class ResponsesController < ApplicationController

  before_filter :authorized, only: [:new, :create]

  respond_to :html, :json

  def new
    @response = Response.new
    @question = Question.random_question
  end

  def create
    # This is where we create the current_users response to the question asked 
    @response = current_user.responses.build(params[:response])
    @response.correct = @response.is_correct?
    params[:commit] == 'true' ? @response.user_response = true : @response.user_response = false
    if @response.save
      flash[:notice] = "Your response was recorded"
      render :show
    else
      flash[:error] = "Something went wrong, please try again"
      render :new
    end
  end
end