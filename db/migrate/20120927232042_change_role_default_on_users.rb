class ChangeRoleDefaultOnUsers < ActiveRecord::Migration
	def change
		change_column_default(:users, :role, 'student')
	end
end
