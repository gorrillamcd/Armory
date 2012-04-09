class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :name
      t.references :course

      t.timestamps
    end
    add_index :exams, :course_id
  end
end
