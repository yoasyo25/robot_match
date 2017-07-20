require "rails_helper"

RSpec.feature "User can login" do
  it "logs in then logs out" do
    user_attributes = { name: "Bob", email: "bob@example.com", password: "password"}

    user = User.create(user_attributes)
    visit login_path

    fill_in "session[name]", with: user_attributes[:name]
    fill_in "session[email]", with: user_attributes[:email]
    fill_in "session[password]", with: user_attributes[:password]

    click_on "Login"

    expect(current_path).to eq(dashboard_user_path(user))
    expect(page).to have_content("Welcome #{user.name}")
    expect(page).to have_content("Successful login")

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("Welcome #{user.name}")
    expect(page).to have_content("Succesful Logout!")

  end
end
