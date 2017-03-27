class AddAttachmentPhotoToAccomodationPhotos < ActiveRecord::Migration
  def self.up
    change_table :accomodation_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :accomodation_photos, :photo
  end
end
