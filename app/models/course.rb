class Course < ApplicationRecord
  belongs_to :meal

  has_many :groceries, dependent: :destroy

  validates :course_type, presence: true
  validates :meal_id, presence: true

  COURSE_TYPES = [
    "main course",
    "starter",
    "dessert"
  ]

  def self.course_types
    %w(Main course Starter Desserts)
  end
end
