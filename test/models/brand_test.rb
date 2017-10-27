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

require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
