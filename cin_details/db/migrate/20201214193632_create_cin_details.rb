class CreateCinDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :cin_details do |t|
      t.belongs_to :user
      t.string :cin_number
      t.string :listing_status
      t.string :industry_code
      t.string :state_code
      t.string :company_inc_yr
      t.string :company_type
      t.string :reg_number

      t.timestamps
    end
  end
end
