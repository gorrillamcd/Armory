class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :description
      t.string :teaching
      t.references :course

      t.timestamps
    end
    add_index :lessons, :course_id
  end
end
