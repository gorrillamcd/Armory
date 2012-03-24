class AddAttachmentTeachingToLesson < ActiveRecord::Migration
  def self.up
    add_column :lessons, :teaching_file_name, :string
    add_column :lessons, :teaching_content_type, :string
    add_column :lessons, :teaching_file_size, :integer
    add_column :lessons, :teaching_updated_at, :datetime
    remove_column :lessons, :teaching
  end

  def self.down
    remove_column :lessons, :teaching_file_name
    remove_column :lessons, :teaching_content_type
    remove_column :lessons, :teaching_file_size
    remove_column :lessons, :teaching_updated_at
  end
end
