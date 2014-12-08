class User < ActiveRecord::Base
  belongs_to :profile, polymorphic: true

  validates :email, presence: true, uniqueness: true
  validates :manager, inclusion: { in: [true, false] }
  validates :password_digest, presence: true
end
