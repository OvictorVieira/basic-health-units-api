class Institute < ApplicationRecord

  validates_presence_of :name, :address, :city, :phone, :latitude, :longitude, :neighborhood

  geocoded_by :address
end
