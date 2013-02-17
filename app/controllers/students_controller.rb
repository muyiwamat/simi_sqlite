class StudentsController < ApplicationController
  def new
  end

  def index
  end

  def welcome
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
  end
end
