class Group < ApplicationRecord
  has_many :users
  validates_presence_of :name, :dn
end
