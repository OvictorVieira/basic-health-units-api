class AddDefaultPhoneValueAsNotReportedToInstitute < ActiveRecord::Migration[6.0]
  def change
    change_column :institutes, :phone, :string, null: true
  end
end
