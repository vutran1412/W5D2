# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string           not null
#  content    :text             not null
#  sub_id     :integer
#  post_id    :integer
#  author     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  validates :title, :url, :content, :author, presence: true

  belongs_to :sub, optional: true
  belongs_to :post, optional: true
  belongs_to :user, foreign_key: :author, class_name: :User
  has_many :subs
  has_many :comments
end