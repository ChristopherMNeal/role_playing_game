require 'rails_helper'

describe "adding an inventory" do
  before :each do
    user = User.create({email: 'example@email.com', password: 'testing', admin: true})
    Character.create({name: 'Ronnie', role: 'singer', health: 20, user_id: user.id})
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', :with => 'example@email.com'
    fill_in 'Password', :with => 'testing'
    click_on 'Log in'
    click_link 'Ronnie'
  end

  it "adds an item" do
    click_link 'Add a item'
    fill_in 'Item', :with => 'sledgehammer'
    click_on 'Create Inventory'
    expect(page).to have_content 'sledgehammer'
  end

  it "adds an item" do
    click_link 'Add a item'
    fill_in 'Item', :with => ''
    click_on 'Create Inventory'
    expect(page).to have_content 'There was an error adding your item!'
  end
end

