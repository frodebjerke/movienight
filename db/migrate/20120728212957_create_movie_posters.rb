class CreateMoviePosters < ActiveRecord::Migration
  def change
    create_table :movie_posters do |t|
      t.string :img_type
      t.string :link
      t.references :movie

    end
    add_index :movie_posters, :movie_id
  end
end
