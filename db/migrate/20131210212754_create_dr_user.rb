class CreateDrUser < ActiveRecord::Migration
  def up
    if Rails.env == 'development' or Rails.env == 'test'
      create_table :dr_users do |t|
        t.string :mail
        t.string :pass
        t.integer :uid
        t.string :name
      end
    end
  end

  def down
  end
end
