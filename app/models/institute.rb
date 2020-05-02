class Institute

  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :name, type: String
  field :address, type: String
  field :city, type: String
  field :phone, type: String
  field :neighborhood, type: String
  field :latitude, type: BigDecimal
  field :longitude, type: BigDecimal

  validates_presence_of :name, :address, :city, :latitude, :longitude, :neighborhood

  geocoded_by :address

  scope :ubs_within_ten_km_ordered_by_distance, -> (latitude, longitude, page, per_page) {
    geo_near([latitude, longitude])
      .max_distance(MAX_DISTANCE)
      .order_by([:distance, :asc])

    # page(page)
    #     .per(per_page)
  }

  MAX_DISTANCE = 10

  private_constant :MAX_DISTANCE
end
