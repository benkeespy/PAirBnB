class ListingsController < ApplicationController
	before_action :require_login
	before_action :find_listing, only: [:show, :edit, :update, :destroy] 


		def index
			@listing = Listing.all.order('created_at DESC').page(params[:page])
			
			
		end
		

		def show

		end


		def new
     		 @listing = Listing.new

		end


		def create

			@listing = current_user.listings.new(listing_params)
			if @listing.save
				redirect_to listing_path(@listing)

			else
				render 'new'
				
			end
			
		end

		def edit
			
		end

		def update
			if @listing.update(listing_params)
				redirect_to listing_path(@listing)

			else
				render 'edit'
			end
			
		end

		def destroy
			@listing.destroy
			redirect_to listings_path
			
		end

		def verify

			@listing = Listing.find(params[:listing_id])
			

			unless admin?
	    		flash[:notice] = "Sorry. You are not allowed to perform this action."
	    		return redirect_to listings_path, notice: "Sorry. You do not have the permission to verify a property."
	 		 end
			
		end 

		




		private
		
		def listing_params
			params.require(:listing).permit(:name, :description, :type_of_accommodation, :price, :number_rooms, :number_rooms, :number_beds, :guest_number, :street_address, :zip_code, :city, :state, :country)

		end

		def find_listing
			@listing = Listing.find(params[:id])
		end



end
