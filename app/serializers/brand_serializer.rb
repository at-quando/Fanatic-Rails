# == Schema Information
#
# Table name: brands
#
#  id          :integer          not null, primary key
#  branch      :string(255)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class BrandSerializer < ActiveModel::Serializer
  attributes :id, :branch, :count
  def count
    if @instance_options[:option_name]
      object.products.where(category_id: Category.find_by(title: @instance_options[:option_name].capitalize).id).count
    else
      object.products.count
    end
  end
end
