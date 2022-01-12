require 'rails_helper'

describe "adding a user, then a character" do
  before :each do
    user = User.create({email: 'example@email.com', password: 'testing', admin: true})
    Character.create({name: 'Ronnie', role: 'singer', health: 20, user_id: user.id})
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', :with => 'example@email.com'
    fill_in 'Password', :with => 'testing'
    click_on 'Log in'
  end

  it "deletes a character" do
    click_link 'Ronnie'
    click_link 'Delete character'
    expect(page).to have_no_content 'Ronnie'
  end

  # it "adds a new character" do
  #   click_link 'Create new character'
  #   fill_in 'Name', :with => ''
  #   fill_in 'Role', :with => ''
  #   click_on 'Create Character'
  #   expect(page).to have_content 'There was an error in creating your character!'
  # end
end

