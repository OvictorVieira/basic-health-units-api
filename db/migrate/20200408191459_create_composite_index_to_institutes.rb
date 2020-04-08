class CreateCompositeIndexToInstitutes < ActiveRecord::Migration[6.0]
  def change
    add_index :institutes, [:lat, :long]
  end
end
