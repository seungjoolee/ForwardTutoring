class CreateDrUsersRoles < ActiveRecord::Migration
  def change
  	if Rails.env == 'development'
	    create_table :dr_users_roles do |t|
	      t.integer :uid
	      t.integer :rid

	      t.timestamps
    	end
    end
  end
end
