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
      flash[:notice] = "Your question was added"
      redirect_to questions_path
    else
      flash[:error] = "Something went wrong, please try again"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      redirect_to questions_path, :notice => "Question has been updated"
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
