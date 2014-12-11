class BartenderProfile < ActiveRecord::Base
  has_many :users, as: :profile

  validates :name, presence: true
  validates :phone, presence: true
end
