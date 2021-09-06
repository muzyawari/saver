class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :section, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.datetime :date
      t.integer :completed
      t.boolean :is_event
      t.integer :position

      t.timestamps
    end
  end
end
