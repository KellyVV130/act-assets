require 'rails_helper'

RSpec.describe User, type: :model do
  it {should belong_to(:group)}
  it {should belong_to(:supervisor)}
  it {should have_many(:students)}
  it {should have_and_belong_to_many(:seats)}

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:name)}
end
