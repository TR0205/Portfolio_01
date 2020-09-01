class AddUploadFileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :upload_file, :string
  end
end
