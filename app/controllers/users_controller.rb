class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash[:danger] = 'ユーザーの登録に失敗しました。'
      redirect_to signup_path
    end
  end

  def edit
    @user = User.find(params[:id])

    unless @user == current_user
      redirect_to root_url
    end
  end

  def update
    @user = User.find(params[:id])

    if current_user == @user
      if @user.update(user_params)
        flash[:success] = 'アカウント情報を更新しました。'
        redirect_to edit_user_path
      else
        flash[:danger] = 'アカウント情報の更新に失敗しました。'
        redirect_to edit_user_path
      end
    else
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
