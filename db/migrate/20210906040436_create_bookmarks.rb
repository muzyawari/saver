class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :section, null: false, foreign_key: true
      t.integer :position
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
