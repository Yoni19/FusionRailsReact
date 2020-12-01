class CreateFormationCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :formation_categories do |t|
      t.belongs_to :formation 
      t.belongs_to :category

      t.timestamps
    end
  end
end
