class CreateFormations < ActiveRecord::Migration[6.0]
  def change
    create_table :formations do |t|
      t.string :title
      t.text :description
      t.belongs_to :user

      t.timestamps
    end
  end
end
