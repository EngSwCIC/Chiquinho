class DepartmentController < ApplicationController
  def index
    @departments = Department.all()
  end

  def show
    @department = Department.find(params[:id])
  end
end
