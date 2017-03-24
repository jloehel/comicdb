class AddAddressToPublishers < ActiveRecord::Migration
  def change
    add_column :publishers, :address, :string
  end
end
