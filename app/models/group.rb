class Group < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :events
  has_many :messages
  has_many :memberships
  has_many :members, through: :memberships, source: :user
end