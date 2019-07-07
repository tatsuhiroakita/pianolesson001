class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
    
  end

  private
  ##def user_params
  ##  params.require(:user).permit(:username, :email)
  ##end
  def user_params
    ##params.require(:user).permit(:username, :email, :password, :password_confirmation)
    params.require(:user).permit(:username, :email, :address, :lesson_style,
                                 :password, :password_confirmation)
  end
end
