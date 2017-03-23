class AddColumnToAccomodationPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :accomodation_photos, :accomodation_id, :integer
  end
end
