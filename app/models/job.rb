class Job < ApplicationRecord
    belongs_to :user
    # has_one :job_time, dependent: :destroy
    # has_one :job_info, dependent: :destroy
end
