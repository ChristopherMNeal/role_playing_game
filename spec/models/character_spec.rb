require 'rails_helper'

describe Character do
  it { should have_many(:inventories) } # this
end