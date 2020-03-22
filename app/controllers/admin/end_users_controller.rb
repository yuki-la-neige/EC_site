class Admin::EndUsersController < ApplicationController
  def index
    @user = EndUser.with_deleted.all
  end
end
