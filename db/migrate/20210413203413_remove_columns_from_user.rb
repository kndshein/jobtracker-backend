class RemoveColumnsFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :contacts, :string
    remove_column :users, :jobs, :string
  end
end
