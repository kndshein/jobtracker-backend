class RemoveDateFromJobs < ActiveRecord::Migration[6.1]
  def change
    remove_column :jobs, :date_applied, :date
    remove_column :jobs, :date_offered, :date
    remove_column :jobs, :date_accepted, :date
    remove_column :jobs, :date_companyrejection, :date
    remove_column :jobs, :date_userrejection, :date
    remove_column :jobs, :status, :string
    remove_column :jobs, :time_phonescreen, :datetime
  end
end
