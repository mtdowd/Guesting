class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :manager, inclusion: { in: [true, false] }
  validates :password_digest, presence: true
end
