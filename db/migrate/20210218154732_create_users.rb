class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password
      t.string :password_confirmation
      t.int :user_id
      t.timestamps
    end
    add_index :users, [:id, :username], unique: true
  end
end
