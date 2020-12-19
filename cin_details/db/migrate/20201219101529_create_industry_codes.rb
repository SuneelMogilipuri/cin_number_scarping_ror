class CreateIndustryCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :industry_codes do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
