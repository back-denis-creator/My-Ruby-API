class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true

    # Relationship
    has_many :appointments
    has_many :programs, :through => :appointments 
end
