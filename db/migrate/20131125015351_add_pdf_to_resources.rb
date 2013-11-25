class AddPdfToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :pdf_file_name, :string
    add_column :resources, :pdf_content_type, :string
    add_column :resources, :pdf_file_size, :integer
  end

  def self.down
    remove_column :resources, :pdf_file_name
    remove_column :resources, :pdf_content_type
    remove_column :resources, :pdf_file_size
  end
end

