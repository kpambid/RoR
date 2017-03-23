class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :location
      t.text :image_url

      t.timestamps
    end
  end
end
