# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :content
  has_one :user, serializer: User::CommentsSerializer
end
