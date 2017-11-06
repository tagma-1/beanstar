class Message < ApplicationRecord
  
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :content, :conversation_id, :user_id
  
  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %P")
  end
  
  def other_party
    conversation.recipient_id == current_user.id ? User.find(messages.conversation.sender_id).profile.profile_name : User.find(messages.conversation.recipient_id).profile.profile_name
  end
  
end