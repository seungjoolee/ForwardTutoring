class AddFieldIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :field_id, :integer
  end
end
