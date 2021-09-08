class Program < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true

    def self.search(term)
        if term 
            where(["title LIKE ?","%#{term}%"])
        else
            all
        end
    end 

    # Relationship
    has_many :appointments
    has_many :users, :through => :appointments 
end
