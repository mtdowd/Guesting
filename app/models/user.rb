class User < ActiveRecord::Base
  belongs_to :profile, polymorphic: true
  has_many :bars

  validates :email, presence: true, uniqueness: true
  validates :manager, inclusion: { in: [true, false] }
  validates :password_digest, presence: true

  def owns?(bar)
    bar.user == self
  end
end
