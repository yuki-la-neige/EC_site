class Public::EndUsersController < ApplicationController
  def show
    @user = current_end_user
  end
  def edit
    @user = current_end_user
  end
  def update
    @user = current_end_user
    @user.update(end_users_params)
    redirect_to public_end_user_path
  end
  def withdrawal
    @user = current_end_user
  end

  private
  def end_users_params
    params.require(:end_user).permit(:family_name, :first_name,
     :family_name_kana, :first_name_kana, :phone, :postal_code,
     :address, :withdrawal_flag)
  end
end
