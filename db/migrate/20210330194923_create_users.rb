class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :boards, array:true, default: []
      t.string :contacts, array:true, default: []
      t.datetime :creation_date, default: -> {'NOW()'}

    end
    add_index :users, :email, unique: true
  end
end
