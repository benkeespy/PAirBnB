class EditUserForeignKey < ActiveRecord::Migration[5.1]
  def change
  	remove_foreign_key :authentications, :users

  	add_foreign_key :authentications, :users, on_delete: :cascade

  end
end
