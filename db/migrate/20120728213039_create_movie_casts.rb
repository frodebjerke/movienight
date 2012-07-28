class CreateMovieCasts < ActiveRecord::Migration
  def change
    create_table :movie_casts do |t|
      t.string :name
      t.string :character
      t.references :movie

      t.timestamps
    end
    add_index :movie_casts, :movie_id
  end
end
