class Gallery < ActiveRecord::Migration[5.1]
  
	  def change
	  	create_table :listing_pictures do |t|
	  		t.timestamps null: false
	  		t.string :images
	  		t.integer :listing_id
	  	end
	  end

end
