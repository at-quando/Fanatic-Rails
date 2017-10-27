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

class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :receiver, :address, :phone, :created_at
  has_many :order_items
end
