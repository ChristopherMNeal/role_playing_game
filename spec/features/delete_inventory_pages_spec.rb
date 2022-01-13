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
    click_link 'Add a item'
    fill_in 'Item', :with => 'pitchfork'
    click_on 'Create Inventory'
  end
  
  it "adds an item" do
    click_link 'pitchfork'
    click_link 'Delete item'
    expect(page).to have_no_content 'pitchfork'
  end
end

