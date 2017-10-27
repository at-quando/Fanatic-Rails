# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  parent_id      :integer
#  lft            :integer
#  rgt            :integer
#  depth          :integer          default(0), not null
#  children_count :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Category < ApplicationRecord
  acts_as_nested_set

  has_many :category_brands
  has_many :brands, through: :category_brands
  has_many :properties
  has_many :products

  def self.menu_categories
    categories = {}
    Category.roots.each do |cat|
      cat_menu = {}
      cat.children.each do |childCat|
        cat_leaf_at = {}
        child = childCat.children.to_a
        childC = child.to_a
        childCat.children.each_with_index do |cCat, index|
          if cCat.descendants != []
            cat_leaf = {}
            cat_leaf[cCat.title] = cCat.children
            childC.delete_at(index)
            childC[index] = cat_leaf
          else
            childC[index] = cCat
          end
        end
        cat_menu[childCat.title] = childC
      end
      categories[cat.title] = cat_menu
    end
    categories
  end
end
