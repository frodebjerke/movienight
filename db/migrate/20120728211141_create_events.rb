class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :theme
      t.string :about
      t.references :creator

      t.timestamps
    end
    add_index :events, :creator_id
  end
end
