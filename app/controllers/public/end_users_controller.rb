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
  def destroy
    @user= current_end_user
    @user.destroy
    redirect_to new_end_user_registration_path
  end

  private
  def end_users_params
    params.require(:end_user).permit(:email, :family_name, :first_name,
     :family_name_kana, :first_name_kana, :phone, :postal_code,
     :address, :deleted_at)
  end
end
