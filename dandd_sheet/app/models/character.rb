class Character < ActiveRecord::Base
  belongs_to :user
  validates :class_name, :name, presence: true
end