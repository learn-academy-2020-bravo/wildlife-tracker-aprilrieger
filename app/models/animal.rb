class Animal < ApplicationRecord
    has_many :sightings
    accepts_nested_attributes_for :sightings
    validates :kingdom, presence: true
    validates :common_name, presence: true, uniqueness: true
    validates :latin_name, presence: true, uniqueness: true
    validate :check_common_name_and_latin_name
    def check_common_name_and_latin_name
        if self.common_name == self.latin_name
            errors.add(:common_name, "The common name and latin name cannot be the same.")
            errors.add(:latin_name, "The common name and latin name cannot be the same.")
        end
    end
end
