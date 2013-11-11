class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :resource
      t.string :user
      t.text :content
      t.integer :rating
      t.boolean :anonymous

      t.timestamps
    end
    add_index :reviews, :resource_id
  end
end
