class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.references :lesson
      t.references :exam

      t.timestamps
    end
    add_index :questions, :lesson_id
    add_index :questions, :exam_id
  end
end
