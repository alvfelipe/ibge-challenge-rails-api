class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.string :abbreviation
      t.string :name
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
