class BartenderProfile < ActiveRecord::Base
  has_many :users, as: :profile
end
