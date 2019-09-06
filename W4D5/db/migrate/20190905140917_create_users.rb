class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email, null: false
      t.text :password_digest, null: false
      t.text :session_token, null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :session_token
  end
end
