class ProfessorsController < ApplicationController
  def index
    @professors = Professor.all
  end

  def create
    @professor = Professor.new(professor_params)
    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'professor foi criado com sucesso' }
        format.json { render :index, status: :created, location: @professor }
      else
        format.html { render :index }
        format.json { render json: @professor.erros, status: :unprocessable_entity }
      end
    end
  end

  def show
    @professor = Professor.find(params[:id])
  end

  def new; end

  def edit; end

  def update; end

  def destroy; end

  private

  def professor_params
    params.require(:professor).permit(:name)
  end
end
