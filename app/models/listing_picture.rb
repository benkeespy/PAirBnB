class ListingPicture < ApplicationRecord

	belongs_to :listing
	attr_accessible :listing_id
 	mount_uploader :image, ImageUploader

end
