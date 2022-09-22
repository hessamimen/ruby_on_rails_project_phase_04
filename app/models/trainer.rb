class Trainer < ApplicationRecord
    has_many :appointments
    has_many :clients, through: :appointments


    validates_presence_of :name
    validates_length_of :name, :maximum => 200
    validates_length_of :name, :minimum => 1
end
