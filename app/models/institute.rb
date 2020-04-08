class Institute < ApplicationRecord

  validates_presence_of :name, :address, :city, :phone, :latitude, :longitude, :neighborhood
end
