class AddRequestedToExchanges < ActiveRecord::Migration[6.0]
  def change
    add_column :exchanges, :requested, :boolean, default: false
  end
end
