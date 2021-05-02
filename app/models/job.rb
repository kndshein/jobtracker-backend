class Job < ApplicationRecord
    belongs_to :user
    has_many :time_interviews
end
