class QuestionsController < ApplicationController
  
  before_filter :authorized, only: [:new, :create]

  respond_to :html, :json

  def index
    @questions = Question.paginate(page: params[:page])
    # this is now in application controller as a proc so its system wide for AJAX (xhr) calls
    # render :layout => false if request.xhr?
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = "Your question was added"
      respond_with(@question)
    else
      flash[:error] = "Something went wrong, please try again"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      redirect_to questions_path, :notice => "The question has been updated"
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      redirect_to questions_path, :notice => "Question deleted"
    end
  end
end
