class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.integer :capacity
      t.date :date
      t.belongs_to :formation
      t.belongs_to :room


      t.timestamps
    end
  end
end
