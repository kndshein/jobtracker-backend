class RenameTimeInterviewToTimeline < ActiveRecord::Migration[6.1]
  def change
    rename_table :time_interviews, :timeline_times
  end
end
