class Appointment < ApplicationRecord
    belongs_to :client
    belongs_to :trainer

    scope :sorted, lambda { order(time: :asc) }

    validates_presence_of :time
end
