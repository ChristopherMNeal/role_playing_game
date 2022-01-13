require 'rails_helper'

describe Character do
  it { should have_many(:inventories) } # this
  it { should validate_presence_of :name }
  it { should validate_presence_of :role }
  it { should validate_presence_of :health }
end