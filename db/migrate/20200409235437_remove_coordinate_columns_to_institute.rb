class RemoveCoordinateColumnsToInstitute < ActiveRecord::Migration[6.0]
  def change
    remove_column :institutes, :latitude
    remove_column :institutes, :longitude
  end
end
