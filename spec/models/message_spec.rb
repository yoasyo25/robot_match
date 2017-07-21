require 'rails_helper'

describe Message do

  before :each do
    @sender = User.create(name: "bob",
                            email: "bob@example.com",
                            password: "password")
    @recipient = User.create(name: "smith",
                            email: "smith@example.com",
                            password: "password")
    @conversation = Conversation.create(sender_id: @sender.id,
                                       recipient_id: @recipient.id)
    @message = Message.create(body: "This is a message",
                            conversation_id: @conversation.id,
                            user_id: @sender.id)
  end
  describe "relationships" do
    it "belongs to user" do


      expect(@message).to respond_to(:user)
    end
  end

  describe "validations" do
    it "is valid with body, user, and conversation" do

      expect(@message).to be_valid
    end

    it "is invalid without a body" do
      message = Message.create(conversation_id: @conversation.id,
                              user_id: @sender.id)

      expect(message).to_not be_valid
    end

    it "is invalid without a conversation" do
      message = Message.create(body: "This is a message",
                              user_id: @sender.id)

      expect(message).to_not be_valid
    end

    it "is invalid without a user id" do
      message = Message.create(body: "This is a message",
                              conversation_id: @conversation.id,)

      expect(message).to_not be_valid
    end
  end

end
