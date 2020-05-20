class AddUniqueIndexToUserEvents < ActiveRecord::Migration[6.0]
  def change
    add_index :user_events, [:event_id, :user_id], unique: true
  end
end
