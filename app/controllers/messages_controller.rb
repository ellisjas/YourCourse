class MessagesController < ApplicationController
  
  def create
    message_params = params.require(:message).permit(:name, :email, :body)
    @message = Message.new message_params

    if @message.valid?
      MessageMailer.contact_me(@message).deliver_now
      flash[:success] = "Message sent"
      redirect_to :back
    else
      flash[:danger] = "Message not sent. Please fill in all fields."
      redirect_to :back
    end
  end
  
end
