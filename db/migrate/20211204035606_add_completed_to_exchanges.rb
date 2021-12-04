class AddCompletedToExchanges < ActiveRecord::Migration[6.0]
  def change
    add_column :exchanges, :completed, :boolean, default: false
  end
end
