class RemoveLessonidFromQuestion < ActiveRecord::Migration
  def change
  	remove_index :questions, :lesson_id
  	remove_column :questions, :lesson_id
  end
end
