class QuestionsController < ApplicationController
  
  before_filter :authorized, only: [:new, :create]

  # respond_to :html, :json

  def index
    @questions = Question.paginate(page: params[:page])
    # this is now in application controller as a proc so its system wide for AJAX (xhr) calls
    # render :layout => false if request.xhr?
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(params[:question])
    if @question.save
      flash[:notice] = "Your question was added"
      respond_to do |format| 
        format.html { redirect_to root_path }
        format.json { render json: @question, status: :created }
      end

    else
      flash[:error] = "Something went wrong, please try again"
      if @question.errors.any?
        puts @question.errors.messages
      end
      respond_to do |format|
        format.html { render :new, :error => "Something went wrong, please try again." }
        format.json { render :json => { :error => @question.errors.messages}, :status => 422 }
      end   
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
