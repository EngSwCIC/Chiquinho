class AddProfessorToCourse < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :professors, foreign_key: true
    add_reference :professors, :courses, foreign_key: true
  end
end
