class MessagesController < ApplicationController
  before_action :find_message, only: [:edit, :show, :update, :destroy]
  # before_action :authenticate_user!
  def index
    if user_signed_in?
      @messages = Message.where(:user_id => current_user.id).order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @message = current_user.messages.build
  end

  def edit
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      redirect_to @message
    else
      render :new
    end
  end

  def update
    if @message.update(message_params)
      redirect_to @message
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :description, :user_id)
  end
end
