class CreateTimeInterview < ActiveRecord::Migration[6.1]
  def change
    create_table :time_interviews do |t|
      t.string :title
      t.datetime :time
    end
  end
end
