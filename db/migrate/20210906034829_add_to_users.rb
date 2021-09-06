class AddToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :dob, :datetime
    add_column :users, :phone, :integer
    add_column :users, :gender, :string
    add_column :users, :user_img, :string
  end
end
