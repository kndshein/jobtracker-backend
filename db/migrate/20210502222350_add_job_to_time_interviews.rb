class AddJobToTimeInterviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :time_interviews, :job, null: false, foreign_key: true
  end
end
