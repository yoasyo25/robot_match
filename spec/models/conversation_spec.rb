require 'rails_helper'

describe Conversation do
  describe "relationships" do
    it "belongs to many users" do

      sender = User.create(id: 3, name: "bob",
                        email: "bob@example.com",
                        password: "password")
      recipient = User.create(name: "smith",
                        email: "smith@example.com",
                        password: "password")

      conversation = Conversation.create(sender_id: sender.id,
                                         recipient_id: recipient.id)

      expect(conversation.sender_id).to eq(sender.id)
    end
  end
end
