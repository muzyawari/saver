class AddCardColorsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :card_color, :string, default: "#372f2f"
  end
end
