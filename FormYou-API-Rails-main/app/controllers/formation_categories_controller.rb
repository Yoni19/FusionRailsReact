class FormationCategoriesController < ApplicationController
  before_action :set_formation_category, only: [:destroy]
  before_action :authenticate_user!, only: [:create, :destroy]


  def create 
    if is_admin
      @formation_category = FormationCategory.new(formation_category_params)
      if @formation_category.save
        render json: @formation_category_category, status: :created, location: formation_categories_url(@formation_category)
      else
        render json: @formation_category.errors, status: :unprocessable_entity
      end
    else 
      render json: {"error": "Only Admins are allowed to create formation_category"}
    end 
  end 


  def destroy
    @formation_category.destroy 
  end


  private 

  def set_formation_category
    @formation_category = FormationCategory.find(params[:id])
  end 

  def formation_category_params
    params.require(:formation_category).permit(:formation_id, :category_id)
  end 

  def is_admin
    if current_user.status != "admin"
       return false
    else 
      return true
    end 
  end 
end
