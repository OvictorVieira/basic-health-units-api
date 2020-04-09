class AddCnpjToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cnpj, :string, limit: 14
    add_index :users, :cnpj, unique: true
  end
end
