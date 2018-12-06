# Controller class to help manage CRUD of the Course model
# and coordinate with which views to respond to http requests.
class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # Method to exibit all courses
  # ==== Returns
  # * html containing all courses for GET /courses
  # * json containing all courses for GET /courses.json
  def index
    @courses = Course.all
  end

  # Method to exibit a specific course
  # ==== Returns
  # * html with info for a specific course for GET /courses/:id
  # * json with info for a specific course for GET /courses/:id.json
  def show
    @subjects = @course.subjects
    @obrigatorias = []
    @optativas = []
    @subjects.each do |subject|
      if subject.course_subjects.find_by(course_id: @course.id).kind == "obrigatória"
        @obrigatorias << subject
      else
        @optativas << subject
      end
    end
    if @course.professors_id != nil
      @coordinator = Professor.find_by(id: @course.professors_id)
    end

    @flow = Flow.get_semesters(@course)

  end

  # Method to instantiate a new course being created
  # ==== Returns
  # * html with a form for a new course for GET /courses/new
  def new
    @course = Course.new
  end

  # Method to help edit a course
  # ==== Returns
  # * html for a editing form for GET /courses/:id/edit
  def edit
  end

  # Method to create a new course on the database from a form over POST
  # ==== Returns
  # * html with a success message or the new page with errors for POST /courses
  # * json with a success message or with errors for POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # Method to create a new course on the database from a form over POST
  # ==== Returns
  # * html with a success message or the edit page with errors for PUT/PATCH /courses/:id
  # * json with a success message or with errors for PUT/PATCH /courses/:id.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # Method to remove a course from the database
  # ==== Returns
  # * html with a success message for DELETE /courses/:id
  # * json with nothing for DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Method to instantiate a course and its professors
  # ==== Alters
  # * +@course+ - Specific course
  # * +@professors+ - Professors of +@course+
  def course_professors
    @course = Course.find(params[:id])
    @professors = Professor.where(departments_id: @course.departments_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:kind, :code, :name, :turn, :type)
    end
end
