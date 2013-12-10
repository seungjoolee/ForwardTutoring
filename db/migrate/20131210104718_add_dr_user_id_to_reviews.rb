class AddDrUserIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :dr_user_id, :integer
  end
end
