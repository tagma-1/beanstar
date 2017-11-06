class ConversationPolicy < ApplicationPolicy
  attr_reader :user, :conversation

  def initialize(user, conversation)
    @user = user
    @conversation = conversation
  end

  def create?
    conversation.sender_id == @user.id || conversation.recipient_id == @user.id
  end

end