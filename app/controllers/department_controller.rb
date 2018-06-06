class DepartmentController < ApplicationController
  def index
    @departments = Department.all()
  end

  def show
    @department = Department.find(params[:id])
    @professors = Professor.where(departments_id: params[:id])
    @courses = Course.where(departments_id: params[:id])
  end
end
