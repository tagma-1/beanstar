class ConversationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @conversations = Conversation.all
  end
  
  def create
    #Only creates a new conversation if one does not already exist between these two users.
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      redirect_to conversation_messages_path(@conversation)
    elsif current_user.profile
      @conversation = Conversation.create!(conversation_params)
      authorize @conversation
      redirect_to conversation_messages_path(@conversation)
    else
      flash[:danger] = "You must create a profile to message other users."
      redirect_to new_profile_path
    end
  end

private
  
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

end