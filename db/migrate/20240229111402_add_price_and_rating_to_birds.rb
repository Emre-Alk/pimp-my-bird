class AddPriceAndRatingToBirds < ActiveRecord::Migration[7.1]
  def change
    add_column :birds, :price, :integer
    add_column :birds, :rating, :float
  end
end
