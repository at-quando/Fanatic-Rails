class CategoryBrand < ApplicationRecord
  belongs_to :category, :dependent => :destroy 
  belongs_to :brand, :dependent => :destroy 
end
