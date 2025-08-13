class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to tests_path
    else
      flash.now[:alert] = "Вы Гуру? Подтвердите, пожалуйста, ваш имейл и пароль"
      @email = params[:email]

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: "Вы вышли из системы"
  end
end
