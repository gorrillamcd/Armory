class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :average_grade
      t.references :subscription
      t.references :lesson

      t.timestamps
    end
    add_index :grades, :subscription_id
    add_index :grades, :lesson_id
  end
end
