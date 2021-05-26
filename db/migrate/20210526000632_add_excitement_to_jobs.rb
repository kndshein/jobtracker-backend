class AddExcitementToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :excitement, :integer, default: 0, null: false
  end
end
