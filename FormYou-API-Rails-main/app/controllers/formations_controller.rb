class FormationsController < ApplicationController
  before_action :set_formation, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create]


  def index
    @formations = Formation.all
    render json: @formations
  end

  def show
    render json: @formation
  end

  def create 
    if is_admin
      @formation = Formation.new(formation_params)
      if @formation.save
        render json: @formation, status: :created, location: formations_url(@formation)
      else
        render json: @formation.errors, status: :unprocessable_entity
      end
    else 
      render json: {"error": "Only Admins are allowed to create formations"}
    end 
  end 

  def update
    if is_admin
      if @formation.update(formation_params)
        render json: @formation
      else 
        render json: @formation.errors, status: :unprocessable_entity
      end
    end 
  end 

  def destroy
    @formation.destroy 
  end


  private 

  def set_formation
    @formation = Formation.find(params[:id])
  end 

  def formation_params
    params.require(:formation).permit(:title, :description).merge(user_id: current_user.id)
  end 

  def is_admin
    if current_user.status != "admin"
       return false
    else 
      return true
    end 
  end 
end
