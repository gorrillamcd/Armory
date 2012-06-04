class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :type
      t.integer :weight
      t.references :lesson

      t.timestamps
    end
    add_index :exams, :lesson_id
  end
end
