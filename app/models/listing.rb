class Listing < ApplicationRecord

enum verification_status: [ :not_verified, :verified ]

belongs_to :user


end
