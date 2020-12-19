class AddIndexToTables < ActiveRecord::Migration[6.0]
  def change
    add_index :state_codes, :code
    add_index :industry_codes, :code
    add_index :company_types, :code
  end
end
