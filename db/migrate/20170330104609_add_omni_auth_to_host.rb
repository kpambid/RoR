class AddOmniAuthToHost < ActiveRecord::Migration[5.0]
  def change
    add_column :hosts, :provider, :string
    add_column :hosts, :uid, :integer
    add_column :hosts, :name, :string
    add_column :hosts, :oauth_token, :string
    add_column :hosts, :oauth_expires_at, :datetime
  end
end
