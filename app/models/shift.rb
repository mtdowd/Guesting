class Shift < ActiveRecord::Base
  belongs_to :bar

  delegate :name, to: :bar, prefix: true

  validates :bar_id, presence: true
  validates :shift_date, presence: true
  validates_uniqueness_of(:shift_date, scope: :shift_start)
  validates :shift_start, presence: true

  def self.by_most_recent
    order(shift_date: :asc)
  end
end
