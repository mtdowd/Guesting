class Bar < ActiveRecord::Base
  validates :address, presence: true
  validates :city, presence: true
  validates :name, presence: true
  validates_uniqueness_of(
    :name,
    scope: [:address, :city, :state]
  )
  validates :phone, presence: true
  validates :state, presence: true
  validates :zip, presence: true
end
