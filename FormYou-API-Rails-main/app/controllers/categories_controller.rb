class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create]


  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    render json: @category
  end

  def create 
    if is_admin
      @category = Category.new(category_params)
      if @category.save
        render json: @category, status: :created, location: categories_url(@category)
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    else 
      render json: {"error": "Only Admins are allowed to create categories"}
    end 
  end 

  def update
    if is_admin
      if @category.update(category_params)
        render json: @category
      else 
        render json: @category.errors, status: :unprocessable_entity
      end
    end 
  end 

  def destroy
    @category.destroy 
  end


  private 

  def set_category
    @category = Category.find(params[:id])
  end 

  def category_params
    params.require(:category).permit(:name)
  end 

  def is_admin
    if current_user.status != "admin"
       return false
    else 
      return true
    end 
  end 
end
