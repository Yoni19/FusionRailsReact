class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create]


  def index
    @sessions = Session.all
    render json: @sessions
  end

  def show
    render json: @session
  end

  def create 
    if is_admin
      @session = Session.new(session_params)
      if @session.save
        render json: @session, status: :created, location: sessions_url(@session)
      else
        render json: @session.errors, status: :unprocessable_entity
      end
    else 
      render json: {"error": "Only Admins are allowed to create sessions"}
    end 
  end 

  def update
    if is_admin
      if @session.update(session_params)
        render json: @session
      else 
        render json: @session.errors, status: :unprocessable_entity
      end
    end 
  end 

  def destroy
    @session.destroy 
  end


  private 

  def set_session
    @session = Session.find(params[:id])
  end 

  def session_params
    params.require(:session).permit(:capacity, :date, :formation_id, :room_id)
  end 

  def is_admin
    if current_user.status != "admin"
       return false
    else 
      return true
    end 
  end 
end
