class RemoveBoardsFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :boards, :string
  end
end
