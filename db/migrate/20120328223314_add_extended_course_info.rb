class AddExtendedCourseInfo < ActiveRecord::Migration
  def up
  	add_column :courses, :identifier, :string
  	add_column :courses, :credits, :integer
  end

  def down
  	remove_column :courses, :identifier
  	remove_column :courses, :credits
  end
end
