class ChatUsController < ApplicationController
  def new
    @chat_us = ChatUs.new
  end

  def create
    @chat_us = ChatUs.new(chat_us_params)

    if @chat_us.save
      flash[:notice] = "Your message has been sent successfully!"
      redirect_to root_path
    else
      flash.now[:alert] = "There were errors in your submission."
      redirect_to root_path
    end
  end

  private

  def chat_us_params
    params.require(:chat_us).permit(:first_name, :last_name, :email, :phone_number, :comment)
  end
end
