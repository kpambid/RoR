class CreateAccomodations < ActiveRecord::Migration[5.0]
  def change
    create_table :accomodations do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
