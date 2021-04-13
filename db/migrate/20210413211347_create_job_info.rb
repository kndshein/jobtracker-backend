class CreateJobInfo < ActiveRecord::Migration[6.1]
  def change
    create_table :job_infos do |t|
      t.text :job_description
      t.string :resume
      t.string :coverletter
      t.string :location_city
      t.string :location_state
      t.timestamps
    end
  end
end
