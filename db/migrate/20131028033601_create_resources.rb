class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :posted_by
      t.string :category
      t.text :description
      t.string :link
      t.timestamps
    end
  end
end
