class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  has_many :reviews
end
