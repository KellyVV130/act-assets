require 'rails_helper'

RSpec.describe Room, type: :model do
  # Association test
  # 确保一个房间有多个座位
  it { should have_many(:seats).dependent(:destroy) }
  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:coords) }
end
