class Group < ApplicationRecord
  validates :title, presence: true
  has_many :posts
  belongs_to :user
  has_many :group_users
  has_many :members, through: :group_users, source: :user
end
