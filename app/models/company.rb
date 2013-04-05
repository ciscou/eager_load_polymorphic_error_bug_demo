class Company < ActiveRecord::Base
  attr_accessible :name

  has_one :address, as: :addressable
end
