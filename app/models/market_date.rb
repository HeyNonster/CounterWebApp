class MarketDate < ApplicationRecord
  belongs_to :market
  validates :market_id, presence: true
  validates :day, presence: true
  validates :minute_filter, presence: true, numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1
            }
end
