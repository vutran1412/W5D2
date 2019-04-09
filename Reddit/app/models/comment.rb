# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  content    :text             not null
#  author     :integer          not null
#  post_id    :integer
#  comment_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :content, :author, presence: true

  belongs_to :post
  belongs_to :comment
  has_many :comments
  belongs_to :author, foreign_key: :author, class_name: :User
end