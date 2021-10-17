class Address < ApplicationRecord
  belongs_to :customer



  def order_adress
    postal_code + address + name
  end
end
