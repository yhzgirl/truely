class QuestionsController < ApplicationController
  
  before_filter :authorized, only: [:new, :create]

  def index
    @questions = Question.paginate(page: params[:page])
  end

  def new
    # debugger
    @question = Question.new
    if current_user
      render :layout => false
    # alternative way to handle not doubling up on footer
    # else
    #   render :not_logged_in, :layout => false  -this requires creation of _not_logged_in.html.erb with a message
    end
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = "Your question was added"
      redirect_to questions_path
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
