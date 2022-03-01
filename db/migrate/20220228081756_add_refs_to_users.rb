class AddRefsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :group, foreign_key: true
    add_column :users, :supervisor_id, :integer
    create_join_table :users, :seats do |t|
      # t.index [:user_id, :seat_id]
      # t.index [:seat_id, :user_id]
    end
  end
end
