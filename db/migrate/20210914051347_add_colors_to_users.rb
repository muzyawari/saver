class AddColorsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bg_color, :string, default: "#151828"
    add_column :users, :txt_color, :string, default: "#FFFFFF"
  end
end
