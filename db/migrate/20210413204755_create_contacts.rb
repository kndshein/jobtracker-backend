class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :linkedin
      t.datetime :creation_date, default: -> {'NOW()'}
    end
  end
end
