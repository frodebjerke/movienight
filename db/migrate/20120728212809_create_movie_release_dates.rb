class CreateMovieReleaseDates < ActiveRecord::Migration
  def change
    create_table :movie_release_dates do |t|
      t.string :place
      t.date :release_date
      t.references :movie

      t.timestamps
    end
    add_index :movie_release_dates, :movie_id
  end
end
