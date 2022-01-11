require 'rails_helper'

describe Inventory do
  it { should belong_to(:character) } # or this
end