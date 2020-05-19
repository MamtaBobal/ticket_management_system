class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :event_date
      t.integer :fee, default: 0

      t.timestamps
    end
  end
end
