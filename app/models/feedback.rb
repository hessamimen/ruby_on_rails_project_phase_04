class Feedback < ApplicationRecord
    belongs_to :client
    belongs_to :trainer
end
