class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :created_groups, class_name: "Group", foreign_key: "creator_id"
  has_many :messages
end