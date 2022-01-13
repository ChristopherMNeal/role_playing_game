require 'rails_helper'

describe Inventory do
  it { should belong_to(:character) } # or this
  it { should validate_presence_of :item }
  it { should validate_presence_of :quantity }
end