class Address < ActiveRecord::Base
  attr_accessible :street

  belongs_to :addressable, polymorphic: true

  scope :by_street, ->(q) { where(street: q) }
  scope :include_addressable, -> { includes(:addressable) }
end
