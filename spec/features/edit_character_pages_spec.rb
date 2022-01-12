require 'rails_helper'
# Rails.application.load_seed

describe "adding a user, then a character" do
  before :each do
    1.times do |index|
      user = User.create!({email: 'admin2@fake.com', password: 'testing', admin: true})
      rand(3..8).times do |index|
        Character.create!({name: Faker::Superhero.name, role: Faker::Superhero.prefix, health: rand(11..21), user_id: user.id})
      end
    end
    1.times do |index|
      user = User.create!({email: 'user2@fake.com', password: 'testing', admin: false})
      rand(3..8).times do |index|
        Character.create!({name: Faker::Superhero.name, role: Faker::Superhero.prefix, health: rand(11..21), user_id: user.id})
      end
    end
    
    visit '/'
    click_link 'Sign In'
    fill_in 'Email', :with => 'admin2@fake.com'
    fill_in 'Password', :with => 'testing'
    click_on 'Log in'
    click_link 'Create new character'
    fill_in 'Name', :with => 'Herbert'
    fill_in 'Role', :with => 'Scribe'
    click_on 'Create Character'
  end

  it "edits a character" do
    click_link 'Herbert'
    click_link 'Edit character'
    fill_in 'Name', :with => 'Brian'
    fill_in 'Role', :with => 'Scribe'
    fill_in 'Health', :with => '99'
    click_on 'Update Character'
    expect(page).to have_content 'Brian'
  end

  it "fails to edit a character" do
    click_link 'Herbert'
    click_link 'Edit character'
    fill_in 'Name', :with => ''
    fill_in 'Role', :with => 'Scribe'
    fill_in 'Health', :with => '99'
    click_on 'Update Character'
    expect(page).to have_content 'There was an error in updated your character!'
  end
end
