class Address < ApplicationRecord
  belongs_to :end_user
  
  def view_address_detail
    "〒#{self.postal_code} #{self.address} #{self.name}"
  end
end
