class Changestringstotexts < ActiveRecord::Migration

  def change
    change_column(:courses, :description, :text)
    change_column(:lessons, :description, :text)
    change_column(:questions, :text, :text)
  end

end
