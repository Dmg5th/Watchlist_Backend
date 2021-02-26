class AddTitleToUserMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :user_movies, :title, :string
  end
end
