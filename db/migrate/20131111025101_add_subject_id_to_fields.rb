class AddSubjectIdToFields < ActiveRecord::Migration
  def change
    add_column :fields, :subject_id, :integer
  end
end
