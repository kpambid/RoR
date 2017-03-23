class AddColumnToAccomodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accomodations, :host_id, :integer
  end
end
