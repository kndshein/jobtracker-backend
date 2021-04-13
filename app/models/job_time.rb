class Job_Time < ApplicationRecord
    belongs_to :job
    has_many :time_interviews
end
