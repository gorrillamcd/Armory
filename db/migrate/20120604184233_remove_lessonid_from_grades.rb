class RemoveLessonidFromGrades < ActiveRecord::Migration
	def change
		remove_index :grades, :lesson_id
		remove_column :grades, :lesson_id
		add_column :grades, :exam_id, :integer
		add_index :grades, :exam_id
	end
end
