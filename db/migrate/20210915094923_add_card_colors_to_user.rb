class AddCardColorsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :card_color, :string
  end
end
