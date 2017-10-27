# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  status     :integer          default("Pending")
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
  has_many :order_items
  # has_many :products, through: :order_items
  belongs_to :user

  enum status: %w[Pending Delivering Delivered]
end
