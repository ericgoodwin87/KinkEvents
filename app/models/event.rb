class Event < ApplicationRecord
  belongs_to :group
  belongs_to :creator, class_name: "User"
  validates :name, presence: true
  validates :date, presence: true
end
