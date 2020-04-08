class CreateInstitutes < ActiveRecord::Migration[6.0]
  def change
    create_table :institutes do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :phone, null: false, length: 10
      t.decimal :lat, precision: 10, scale: 6, null: false
      t.decimal :long, precision: 10, scale: 6, null: false

      t.timestamps
    end
  end
end
