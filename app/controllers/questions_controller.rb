class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:success] = "Your question was added"
      redirect_to questions_path
    else
      flash[:error] = "Something went wrong, please try again"
      render :new
    end
  end

  def edit
  end

  def show
    @question = Question.find(params[:id])
  end
end
