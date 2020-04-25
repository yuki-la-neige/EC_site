class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end
  def create
    @address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    if @address.save
      redirect_to public_addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end
  def edit
  end
  def update
  end
  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name, :end_user_id)
  end
end
