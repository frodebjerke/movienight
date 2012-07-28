class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :id
      t.string :title
      t.string :year
      t.string :mpaa_rating
      t.string :runtime
      t.string :critics_consensus
      t.string :synopsis

      t.timestamps
    end
  end
end
