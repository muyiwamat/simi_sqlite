class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      #rediret to homepage or redirect to welcome and ask to validate account....
      flash[:success] = "welcome you have successfully created an account"
      redirect_to @student
    else
      render 'new'
    end
  end

  def index
  end

  def welcome
    # @student = Student.find(params[:id])
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
  end
end
