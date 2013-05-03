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
    params[:commit] == 'true' ? @response.user_response = true : @response.user_response = false
    @response.correct = @response.is_correct?
    if @response.save
      render :show
    else
      flash[:error] = "Something went wrong, please try again"
      render :new
    end
  end
end