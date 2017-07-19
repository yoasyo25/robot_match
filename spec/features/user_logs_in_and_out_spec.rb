require "rails_helper"

RSpec.feature "User can login" do
  it "logs in" do
    user_attributes = { name: "Bob", email: "bob@example.com", password: "password"}

    visit login_path

    fill_in "user[name]", with: user_attributes[:name]
    fill_in "user[email]", with: user_attributes[:email]
    fill_in "user[password]", with: user_attributes[:password]
    click_on "Login"

    user = User.last

    expect(current_path).to eq(dashboard_user_path(user))
    expect(page).to have_content("Welcome, #{user.name}")
    expect(page).to have_content("Successful login")
  end
end
