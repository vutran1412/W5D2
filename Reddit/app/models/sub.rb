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

  belongs_to :user, foreign_key: :moderator, class_name: :User
  has_many :posts
  has_many :comments
end