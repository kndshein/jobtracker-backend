class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :status
      t.string :job_title
      t.string :job_industry
      t.string :company_name
      t.datetime :creation_date, default: -> {'NOW()'}
    end
  end
end
