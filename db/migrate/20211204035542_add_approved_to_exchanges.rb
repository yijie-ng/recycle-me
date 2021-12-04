class AddApprovedToExchanges < ActiveRecord::Migration[6.0]
  def change
    add_column :exchanges, :approved, :boolean, default: false
  end
end
