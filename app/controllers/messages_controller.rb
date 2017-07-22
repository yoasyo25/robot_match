class MessagesConroller < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:converastion_id])
  end

  def index
  end
end
