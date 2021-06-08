class Job < ApplicationRecord
    belongs_to :user
    has_many :timeline_times, :dependent => :destroy
end