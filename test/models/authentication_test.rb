# == Schema Information
#
# Table name: authentications
#
#  id              :integer          not null, primary key
#  uid             :string(255)      default(""), not null
#  provider        :string(255)      default("email"), not null
#  password_digest :string(255)
#  access_token    :text(65535)
#  confirm_send_at :datetime
#  confirm_token   :string(255)
#  confirm_at      :datetime
#  remember_digest :string(255)
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class AuthenticationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
