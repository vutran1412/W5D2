# == Schema Information
#
# Table name: subs
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :text             not null
#  post_id     :integer
#  moderator   :integer          not null
#  sub_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, :moderator, presence: true

  belongs_to :moderator, foreign_key: :moderator, class_name: :User
  belongs_to :post
  belongs_to :sub, foreign_key: :sub_id, class_name: :Sub
  has_many :posts
  has_many :subs, foreign_key: :sub_id, class_name: :Sub
  has_many :comments
end