class Shift < ActiveRecord::Base
  belongs_to :bar

  has_one :shift_metric

  has_many :shift_memberships, dependent: :destroy
  has_many :users, through: :shift_memberships

  delegate :name, to: :bar, prefix: true
  delegate :name, to: :user, prefix: true
  delegate :sales, to: :shift_metric
  delegate :patron_count, to: :shift_metric

  validates :bar_id, presence: true
  validates :shift_date, presence: true
  validates_uniqueness_of(:shift_date, scope: :shift_start)
  validates :shift_start, presence: true

  def self.by_most_recent
    order(shift_date: :asc)
  end

  def add_bartender(user)
    users << user
  end

  def remove_bartender(user)
    users.delete(user)
  end
end
