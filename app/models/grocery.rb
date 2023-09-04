class Grocery < ApplicationRecord
  belongs_to :household

  validates :name, presence: true
  validates :quantity, presence: true
  validates :measurement, presence: true
  # validates :erecipe_id, presence: true


  #  Add ordered sequence of :foodCat then :name
end
