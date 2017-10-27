# == Schema Information
#
# Table name: properties
#
#  id         :integer          not null, primary key
#  color      :string(255)
#  size       :string(255)
#  storage    :integer
#  price      :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Property < ApplicationRecord
  belongs_to :product
  has_many :order_items
  has_many :images
end
