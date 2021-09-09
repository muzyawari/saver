class AddNametoSections < ActiveRecord::Migration[6.1]
  def change
    add_column :sections, :name, :string
  end
end
