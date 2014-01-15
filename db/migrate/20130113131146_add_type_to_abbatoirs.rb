class AddTypeToAbbatoirs < ActiveRecord::Migration
  def change
    add_column :abbatoirs, :type, :string
  end
end
