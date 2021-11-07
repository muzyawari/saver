class Add < ActiveRecord::Migration[6.1]
  def change
    add_reference :webs, :section, null: false, foreign_key: true
  end
end
