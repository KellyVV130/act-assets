require 'rails_helper'

RSpec.describe Seat, type: :model do
  # Association test
  # 确保一个座位在一个房间里
  it { should belong_to(:room) }
  # Validation test
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:top) }
  it { should validate_presence_of(:left) }
  it { should validate_presence_of(:right) }
  it { should validate_presence_of(:bottom) }
end
