class ChangeTypeToKindOnExam < ActiveRecord::Migration
	def change
		rename_column :exams, :type, :kind
	end
end
