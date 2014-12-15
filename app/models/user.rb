class User < ActiveRecord::Base
  has_many :bar_gig_memberships, dependent: :destroy
  has_many :bars, through: :bar_gig_memberships

  has_many :owned_bars, class_name: "Bar"

  belongs_to :profile, polymorphic: true

  delegate :name, to: :profile

  validates :email, presence: true, uniqueness: true
  validates :manager, inclusion: { in: [true, false] }
  validates :password_digest, presence: true

  def owns?(bar)
    owned_bars.include?(bar)
  end

  def works_at?(bar)
    bars.include?(bar)
  end

  def owns_or_works_at?(bar)
    owns?(bar) || works_at?(bar)
  end
end
