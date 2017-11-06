class MessagesController < ApplicationController
  
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end
  
  def index
    @messages = @conversation.messages
    
    #limits the messages to be displayed in a conversation to the ten most recent (if there is over ten messages)
    if @messages.length > 7
      @over_ten = true
      @messages = @messages[-7..-1]
    end
    
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    
    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end
  
  def create
   @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end
  
  private
    
    def message_params
      params.require(:message).permit(:content, :user_id)
    end
  
end