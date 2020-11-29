class Market < ApplicationRecord
  enum kind: [:urban, :suburban, :rural]
  has_many :market_dates
end
