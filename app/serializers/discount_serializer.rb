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

class DiscountSerializer < ActiveModel::Serializer
  attributes :sale, :quantity
end
