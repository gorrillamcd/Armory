class RemoveExamidFromQuestion < ActiveRecord::Migration

  def up
  	remove_index :questions, :exam_id
  	remove_column :questions, :exam_id
  end

  def down
  	add_column :questions, :exam_id, :integer
  	add_index :questions, :exam_id
  end
  
end
