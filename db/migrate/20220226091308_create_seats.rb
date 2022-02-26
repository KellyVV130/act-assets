class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.string :name
      t.integer :top
      t.integer :left
      t.integer :right
      t.integer :bottom
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
