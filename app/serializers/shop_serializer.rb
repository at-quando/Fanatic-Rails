# == Schema Information
#
# Table name: shops
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  address    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :address, :slogan, :logo, :description
end
