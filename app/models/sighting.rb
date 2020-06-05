class Sighting < ApplicationRecord
    belongs_to :animal
    
    validates :date, presence: true
    validates :long, presence: true
    validates :lat, presence: true
end
