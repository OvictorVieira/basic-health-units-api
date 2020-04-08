class AddNeighborhoodColumnToInstitutes < ActiveRecord::Migration[6.0]
  def change
    add_column :institutes, :neighborhood, :string, null: false
  end
end
