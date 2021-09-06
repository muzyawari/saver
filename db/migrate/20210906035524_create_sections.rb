class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.references :folder, null: false, foreign_key: true
      t.integer :position
      t.integer :section_type
      t.boolean :visible

      t.timestamps
    end
  end
end
