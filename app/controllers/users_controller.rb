class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.update(user_params)

    if @user.save
      session[:user_id] = @user.id
      session[:header_color] = user_params[:header_color]
      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили формы для регистрации'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Профиль обновлен!'
    else
      flash.now[:alert] = 'При попытке сохранить изменения возникла ошибка'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation, :header_color
    )
  end
end
