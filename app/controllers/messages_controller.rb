class MessagesController < ApplicationController
	

	def new
		@current_user = current_user
		@user = User.find(params[:user_id])
		@message = @user.messages.build
		@sent = Message.where(sender_id: current_user.id, user_id: params[:user_id]).last(10).reverse
		@received = Message.where(user_id: current_user.id, sender_id: params[:user_id]).last(10).reverse
		
	end


def create
	@message = Message.new(message_params)
	@message.save
	if @message.save
		redirect_to new_message_path
	end
end


private 

 def message_params
      params.require(:message).permit(:user_id, :sender_id, :body)
    end

end
