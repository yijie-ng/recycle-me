class AddCoordinatesToExchanges < ActiveRecord::Migration[6.0]
  def change
    add_column :exchanges, :latitude, :float
    add_column :exchanges, :longitude, :float
  end
end
