class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :status
      t.string :job_title
      t.string :job_industry
      t.string :company_name
      t.date :date_applied
      t.datetime :time_phonescreen
      t.date :date_offered
      t.date :date_accepted
      t.date :date_companyrejection
      t.date :date_userrejection
      t.text :job_description
      t.string :resume
      t.string :coverletter
      t.string :location_city
      t.string :location_state
      t.datetime :creation_date, default: -> {'NOW()'}
    end
  end
end
