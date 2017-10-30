class Event < ApplicationRecord
  belongs_to :shop
  has_many :discount
end
