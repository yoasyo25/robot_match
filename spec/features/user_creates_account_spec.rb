require 'rails_helper'

RSpec.feature "User creates a new acount" do
  scenario "with valid attributes" do
    user_attributes = {name: "Hans",
                      email: "hans@example.com",
                      password: "password"}

    visit 'users/new'
    fill_in "user[name]", with: user_attributes[:name]
    fill_in "user[email]", with: user_attributes[:email]
    fill_in "user[password]", with: user_attributes[:password]
    click_on "Create Account"

    user = User.last

    expect(current_path).to eq(dashboard_user_path(user))
    expect(page).to have_content("Welcome #{user.name}")
    expect(page).to have_content("Successful login")
  end
end
