class CreateJobTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :job_times do |t|
      t.date :date_applied
      t.datetime :time_phonescreen
      t.date :date_offered
      t.date :date_accepted
      t.date :date_companyrejection
      t.date :date_userrejection
      t.timestamps
    end
  end
end
