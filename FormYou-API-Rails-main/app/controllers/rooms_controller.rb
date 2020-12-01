class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create]


  def index
    @rooms = Room.all
    render json: @rooms
  end

  def show
    render json: @room
  end

  def create 
    if is_admin
      @room = Room.new(room_params)
      if @room.save
        render json: @room, status: :created, location: rooms_url(@room)
      else
        render json: @room.errors, status: :unprocessable_entity
      end
    else 
      render json: {"error": "Only Admins are allowed to create rooms"}
    end 
  end 

  def destroy
    @room.destroy 
  end


  private 

  def set_room
    @room = Room.find(params[:id])
  end 

  def room_params
    params.require(:room).permit(:number)
  end 

  def is_admin
    if current_user.status != "admin"
       return false
    else 
      return true
    end 
  end 
end
