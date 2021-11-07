class CreateWebs < ActiveRecord::Migration[6.1]
  def change
    create_table :webs do |t|
      t.string :url
      t.integer :size
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
