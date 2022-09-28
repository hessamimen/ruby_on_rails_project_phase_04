class Client < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :trainers, through: :appointments
    has_many :feedbacks
    has_many :addresses

    
    
    scope :by_earliest_created, lambda { order(created_at: :asc) }
    # Ex:- scope :active, lambda {where(:active => true)}
    
    accepts_nested_attributes_for :addresses
    
    
    validates :name,  :presence => true,
                      :length => { :within => 2..25 }
    validates :gender,  :presence => true

end
