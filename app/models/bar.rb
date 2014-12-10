class Bar < ActiveRecord::Base
  has_many :bar_gig_memberships, dependent: :destroy
  has_many :users, through: :bar_gig_memberships

  belongs_to :owner, class_name: "User", foreign_key: :user_id

  delegate :name, to: :owner, prefix: true

  validates :address, presence: true
  validates :city, presence: true
  validates :name, presence: true
  validates_uniqueness_of(
    :name,
    scope: [:address, :city, :state]
  )
  validates :phone, presence: true
  validates :state, presence: true
  validates :user_id, presence: true
  validates :zip, presence: true
end
