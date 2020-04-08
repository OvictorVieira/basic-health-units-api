class RenameCoordinateColumnsInInstitute < ActiveRecord::Migration[6.0]
  def change
    rename_column :institutes, :lat, :latitude
    rename_column :institutes, :long, :longitude
  end
end
