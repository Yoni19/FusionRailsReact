class CreateStudentSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :student_sessions do |t|
      t.integer :grade, default: ""
      t.belongs_to :user 
      t.belongs_to :session

      t.timestamps
    end
  end
end
