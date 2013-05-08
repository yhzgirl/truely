class ResponsesController < ApplicationController

  before_filter :authorized, only: [:new, :create]

  respond_to :html, :json

  def new
    @response = Response.new
    @question = Question.get_random_outstanding_question_not_created_by(current_user).first
  end

  def create
    # This is where we create the current_users response to the question asked 
    @response = current_user.responses.build(params[:response])
    params[:commit] == 'Fact' ? @response.user_response = true : @response.user_response = false
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