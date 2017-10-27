class CreateCategoryBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :category_brands do |t|
      t.belongs_to :category
      t.belongs_to :brand

      t.timestamps
    end
    # execute 'ALTER TABLE category_brands ADD PRIMARY KEY (brand_id, category_id);'
  end
end
