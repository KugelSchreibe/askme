class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy hide edit]
  before_action :set_question_for_current_user, only: %i[update destroy hide edit]

  def create 
    @question = Question.new(author: current_user)

    debugger

    if @question.update(question_params_for_create)
      redirect_to user_path(@question.user.nickname), notice: 'Вопрос создан!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили формы для создания вопроса'
      render :new
    end
  end

  def update
    @question.update(question_params_for_update)
    redirect_to user_path(@question.user), notice: 'Вопрос сохранен!'
  end

  def destroy
    @user = @question.user
    @question.destroy
    redirect_to user_path(@user), notice: 'Вопрос удален!'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.order(created_at: :desc).first(10)
    @users = User.order(created_at: :desc).first(10)
  end

  def new
    @user = User.find_by!(nickname: params[:nickname])
    @question = Question.new(user: @user)
  end

  def edit
  end

  def hide
    @question.update(hidden: true)
    redirect_to question_path(@question)
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def question_params_for_create
    params.require(:question).permit(:user_id, :body)
  end

  def question_params_for_update
    params.require(:question).permit(:hidden, :answer)
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end
end
