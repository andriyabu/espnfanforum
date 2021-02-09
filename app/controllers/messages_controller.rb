class MessagesController < ApplicationController
  before_action :find_message, only: [:edit, :show, :update, :destroy]
  def index
    @messages = Message.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.create(message_params)
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

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :description)
  end
end
