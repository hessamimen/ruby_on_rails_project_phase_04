class Client < ApplicationRecord
    has_many :appointments
    has_many :trainers, through: :appointments
    has_many :addresses

    accepts_nested_attributes_for :addresses

    validates_presence_of :name
    validates_length_of :name, :maximum => 200
    validates_length_of :name, :minimum => 1

end
