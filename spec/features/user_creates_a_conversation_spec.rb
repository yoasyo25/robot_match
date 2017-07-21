require "rails_helper"

RSpec.feater "User can create a conversation" do
  it "creates a conversation" do
    user_1 = User.create(name: "Bob", email: "bob@example.com", password: "password")
    user_2 = User.create(name: "Usericus", email: "usericus@example.com", password: "password")



    visit membership_path

    click_on "Usericus"

    expect(current_path).to eq(conversation_messages_path(@converastion))
    expect(page).to have_content("Conversation with Userius")
    expect(page).to have_content("Send")

    fill_in "text_area", with: "Hello, Usericus!"
    click_on "Send"

    expect(current_path).to eq(conversation_messages_path(@converastion))
    expect(page).to have_content("Hello, Usericus!")



  end
end
