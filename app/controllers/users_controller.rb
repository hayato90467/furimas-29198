class UsersController < ApplicationController
  
  def create
    cerrent_user.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :nickname, :first_name, :family_name,
       :first_name_kana, :family_name_kana, :date)
  end
end
