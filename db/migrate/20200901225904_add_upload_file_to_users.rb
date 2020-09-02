class AddUploadFileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :upload_file , :binary, limit: 10.megabyte
  end
end
