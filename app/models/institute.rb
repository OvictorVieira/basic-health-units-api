class Institute < ApplicationRecord

  validates_presence_of :name, :address, :city, :latitude, :longitude, :neighborhood

  geocoded_by :address

  scope :ubs_within_ten_km_ordered_by_distance, -> (latitude, longitude) {
    near([latitude, longitude], 10, units: :km)
      .order('distance')
  }
end
