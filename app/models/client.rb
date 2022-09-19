class Client < ApplicationRecord
    has_many :appointments
    has_many :trainers, through: :appointments
    has_many :addresses

    accepts_nested_attributes_for :addresses

end
