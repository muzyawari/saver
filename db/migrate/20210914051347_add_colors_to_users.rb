class AddColorsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bg_color, :string
    add_column :users, :txt_color, :string
  end
end
