class StudentSessionsController < ApplicationController
  before_action :set_student_session, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create]


  def index
    @student_sessions = StudentSession.all
    render json: @student_sessions
  end

  def show
    render json: @student_session
  end

  def create 
    if is_student
      @student_session = StudentSession.new(student_session_params)
      if @student_session.save
        render json: @student_session, status: :created, location: student_sessions_url(@student_session)
      else
        render json: @student_session.errors, status: :unprocessable_entity
      end
    else 
      render json: {"error": "Only Students are allowed to sign in to sessions"}
    end 
  end 

  def update
    if is_teacher
      if @student_session.update(params.require(:student_session).permit(:grade))
        render json: @student_session
      else 
        render json: @student_session.errors, status: :unprocessable_entity
      end
    end 
  end 

  def destroy
    @student_session.destroy 
  end


  private 

  def set_student_session
    @student_session = StudentSession.find(params[:id])
  end 

  def student_session_params
    params.require(:student_session).permit(:session_id).merge(user_id: current_user.id)
  end 

  def is_teacher
    if current_user.status != "teacher"
       return false
    else 
      return true
    end 
  end 

  def is_student
    if current_user.status != "student"
       return false
    else 
      return true
    end 
  end 
end
