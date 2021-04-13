class AddJobsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :jobs, :string, array:true, default: []
  end
end
