class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.text :name
    	t.text :description
    	t.string :user_id
    	t.string :type_of_accommodation
      t.integer :price
    	
      t.integer :number_rooms
      t.integer :number_beds 
      t.integer :guest_number

      t.string :street_address
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :country

      







      t.timestamps
    end
  end
end