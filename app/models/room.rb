class Room < ApplicationRecord
  has_many :seats, dependent: :destroy # TODO 这是什么意思
  validates_presence_of :name, :coords
end
