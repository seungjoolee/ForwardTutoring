class RemovePostedByFromResources < ActiveRecord::Migration
  def up
    if Rails.env == 'production'
    remove_column :resources, :posted_by
    end
  end

  def down
    add_column :resources, :posted_by, :string
  end
end
