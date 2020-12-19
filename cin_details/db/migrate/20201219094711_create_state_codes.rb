class CreateStateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :state_codes do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
