class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :author
      t.string :summary
      t.text :description

      t.timestamps
    end
  end
end
