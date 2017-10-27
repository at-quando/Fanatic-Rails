# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :text(65535)
#  rating        :float(24)
#  number_review :integer
#  category_id   :integer
#  brand_id      :integer
#  shop_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ProductSerializer < ActiveModel::Serializer
  attributes :id
end
