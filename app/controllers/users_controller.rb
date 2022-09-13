class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit udpate destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.update(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили формы для регистрации'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Профиль обновлен!'
    else
      flash.now[:alert] = 'При попытке сохранить изменения возникла ошибка'
      render :edit
    end
  end

  def destroy
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: 'Пользователь удален'
  end

  def show
    @user = User.find_by!(nickname: params[:nickname])
    @questions = @user.questions.order("created_at DESC")
  end

  private

  def authorize_user
    redirect_with_alert unless current_user == @user
  end

  def set_user
    @user = User.find_by!(nickname: params[:nickname])
  end

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation, :header_color
    )
  end
end
