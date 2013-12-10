class AddDrUserIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :dr_user_id, :integer
  end
end
