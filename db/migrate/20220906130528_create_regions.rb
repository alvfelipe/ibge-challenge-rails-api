class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :abbreviation
      t.string :name

      t.timestamps
    end
  end
end
