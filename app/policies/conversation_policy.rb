class ConversationPolicy < ApplicationPolicy
  attr_reader :user, :conversation

  def initialize(user, conversation)
    @user = user
    @conversation = conversation
  end

  def create?
    conversation.sender == @user
  end
  
  def edit?
    false
  end
  
  def update?
    false
  end
  
  def destroy?
    false
  end
  
  def index?
    conversation.recipient == @user || conversation.sender == @user
  end
  
end