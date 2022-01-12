require 'rails_helper'

describe "adding a user, then a character" do
  before :each do
    visit '/'
    click_link 'Sign Up'

    fill_in 'Email', :with => 'example@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
  end

  it "adds a new character" do
    click_link 'Create new character'
    fill_in 'Name', :with => 'Herbert'
    fill_in 'Role', :with => 'Scribe'
    click_on 'Create Character'
    expect(page).to have_content 'Herbert'
  end
end
