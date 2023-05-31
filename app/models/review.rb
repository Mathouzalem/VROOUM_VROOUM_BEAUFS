class Review < ApplicationRecord
  validates_length_of :comment, :minimum => 5
  belongs_to :booking
end
