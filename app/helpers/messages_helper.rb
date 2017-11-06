module MessagesHelper
  
  #A helper to set the profile name of the person who is not the current user in a conversation
  def other_party
    @conversation.recipient_id == current_user.id ? User.find(@conversation.sender_id).profile.profile_name.capitalize : User.find(@conversation.recipient_id).profile.profile_name.capitalize
  end
  
end
