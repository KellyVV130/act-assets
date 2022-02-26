class Seat < ApplicationRecord
  belongs_to :room
  validates_presence_of :name, :top, :left, :right, :bottom
end
