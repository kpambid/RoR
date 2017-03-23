class CreateAccomodationPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :accomodation_photos do |t|
      t.text :image_url
      t.text :caption

      t.timestamps
    end
  end
end
