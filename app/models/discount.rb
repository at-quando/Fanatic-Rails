class Discount < ApplicationRecord
  belongs_to :event
  belongs_to :property
end
