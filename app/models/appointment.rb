class Appointment < ApplicationRecord
    belongs_to :client
    belongs_to :trainer

    scope :sorted, lambda { order(time: :asc) }

    validates_presence_of :time
    validates_length_of :time, :maximum => 200
    validates_length_of :time, :minimum => 1
end
