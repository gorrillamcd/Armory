class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :name
      t.boolean :required
      t.references :course

      t.timestamps
    end
    add_index :books, :course_id
  end
end
