# Controller for the Professor model class.

class ProfessorsController < ApplicationController
  include ProfessorsHelper

    # Show professors
    def index
      @favorite_professors = current_user ? current_user.favorite_professors : []
      @professors = Professor.all - @favorite_professors
    end

    # Create a professor
    def create
      @professor = Professor.new(professor_params)
      respond_to do |format|
        if @professor.save
          format.html {redirect_to @professor, notice: 'professor foi criado com sucesso'}
          format.json {render :index, status: :created, location: @professor}
        else
          format.html{render :index}
          format.json {render json: @professor.erros, status: :unprocessable_entity}
        end
      end
    end

    # Insert a professor into user favorite list (ProfessorUserFavorite)
    def favorite
      # Assuming that we've a logged in user

      unless is_favorite?(params[:id], current_user.id)
      ProfessorUserFavorite.create(:professor_id => params[:id],  :user_id => current_user.id)
      end

      flash['notice'] = 'Professor adicionado aos favoritos com sucesso!'
      redirect_to professor_path(params[:id])
    end

    # Remove a professor into user favorite list (ProfessorUserFavorite)
    def unfavorite
      # Assuming that we've a logged in user

      favorite = ProfessorUserFavorite.where('professor_id = ? and  user_id = ?', params[:id],  current_user.id)
      favorite.delete_all unless favorite.empty?

      flash['notice'] = 'Professor removido dos favoritos com sucesso!'
      redirect_to professor_path(params[:id])
    end

    # Show info about a professor
    def show
      @professor = Professor.find(params[:id])
    end
    
    # CRUD professor new page
    def new
    end
    
    # CRUD professor edit page
    def edit
    end

    # Update professor POST method
    def update
    end

    # Destroy professor method
    def destroy
    end

    private
      def professor_params
        params.require(:professor).permit(:name, :office)
      end
end
