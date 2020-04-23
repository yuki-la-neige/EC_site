class Admin::EndUsersController < ApplicationController
  def index
    @user = EndUser.with_deleted.all
  end
  def show
  end
  def edit
  end
  def update
  end
  def withdrawal
  end
end
