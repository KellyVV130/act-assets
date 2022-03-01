class Seat < ApplicationRecord
  belongs_to :room
  has_and_belongs_to_many :users
  validates_presence_of :name, :top, :left, :right, :bottom
end
