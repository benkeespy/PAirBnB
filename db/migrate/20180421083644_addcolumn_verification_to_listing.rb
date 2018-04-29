class AddcolumnVerificationToListing < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :verification_status, :integer, default:0
  end
end
