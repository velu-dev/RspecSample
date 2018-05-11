class User < ApplicationRecord
	has_many :orders
	has_many :carts
#validates :name, presence: true
#validate :phone, :numericality => true,
                # :length => { :minimum => 10, :maximum => 15 }
end
