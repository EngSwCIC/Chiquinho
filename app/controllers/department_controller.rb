# Controller to department pages

class DepartmentController < ApplicationController
  
  # List departments
  def index
    @departments = Department.all()
  end

  # Show a department info
  def show
    @department = Department.find(params[:id])
    @professors = Professor.where(departments_id: params[:id])
    @courses = Course.where(departments_id: params[:id])
  end
end
