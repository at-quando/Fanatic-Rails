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

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
