class AddColumnToHosts < ActiveRecord::Migration[5.0]
  def change
    add_column :hosts, :last_name, :string
  end
end
