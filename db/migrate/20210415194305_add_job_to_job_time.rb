class AddJobToJobTime < ActiveRecord::Migration[6.1]
  def change
    add_reference :job_times, :job, null: false, foreign_key: true
  end
end
