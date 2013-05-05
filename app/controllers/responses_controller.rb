class ResponsesController < ApplicationController

  before_filter :authorized, only: [:new, :create]

  respond_to :html, :json

  def new
    @response = Response.new
    @question = Question.random_question
    # @question = Question.get_random_outstanding_question_for_current_user    
  end

  def create
    # This is where we create the current_users response to the question asked 
    @response = current_user.responses.build(params[:response])
    params[:commit] == 'true' ? @response.user_response = true : @response.user_response = false
    @response.correct = @response.is_correct?
    if @response.save
      respond_to do |format|
        format.html { render :show }
      end
    else
      flash[:error] = "Something went wrong, please try again"
      render :new
    end
  end
end