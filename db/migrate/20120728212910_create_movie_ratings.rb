class CreateMovieRatings < ActiveRecord::Migration
  def change
    create_table :movie_ratings do |t|
      t.string :type
      t.string :value
      t.references :movie

      t.timestamps
    end
    add_index :movie_ratings, :movie_id
  end
end
