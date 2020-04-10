class AddGeocodeColumnToInstitute < ActiveRecord::Migration[6.0]
  def change
    add_column :institutes, :geocode, :st_point, geographic: true, null: false

    add_index :institutes, :geocode, using: :gist
  end
end
