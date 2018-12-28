class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string        :username, null: false
      t.string        :email, null: false, index: true, unique: true
      t.string        :password_digest
      t.string        :city, index: true
      t.string        :state
      t.datetime      :last_login

      t.timestamps
    end
  end
end
