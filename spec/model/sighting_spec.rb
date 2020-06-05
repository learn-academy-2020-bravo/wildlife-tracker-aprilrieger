require "rails_helper"

RSpec.describe "Sighting", :type => :request do
  it "is valid with valid attributes" do
    animal_test = Animal.create common_name: "Coastal tailed frog", latin_name: "Ascaphus truei", kingdom: "Animalia"
    sighting_test = Sighting.create date: "2020-04-05 12:34:00", long: 34.08 N, lat: 38.09 W, animal_id: animal_test.id
    expect(sighting_test).to be_valid
  end

  it "is not valid without a date" do
    animal_test = Animal.create common_name: "Coastal tailed frog", latin_name: "Ascaphus truei", kingdom: "Animalia"
    sighting_date_test = Sighting.create date: nil, long: 34.08 N, lat: 38.09 W, animal_id: animal_test.id
    expect(sighting_date_test.errors[:date]).to_not be_empty
  end

  it "is not valid without lat coordinates" do
    animal_test = Animal.create common_name: "Coastal tailed frog", latin_name: "Ascaphus truei", kingdom: "Animalia"
    sighting_lat_test = Sighting.create date: "2020-04-05 12:34:00", long: 34.08 N, lat: nil, animal_id: animal_test.id
    expect(sighting_lat_test.errors[:lat]).to_not be_empty
  end

  it "is not valid without long coordinates" do
    animal_test = Animal.create common_name: "Coastal tailed frog", latin_name: "Ascaphus truei", kingdom: "Animalia"
    sighting_long_test = Sighting.create date: "2020-04-05 12:34:00", long: nil, lat: 38.09 W, animal_id: animal_test.id
    expect(sighting_long_test.errors[:long]).to_not be_empty
  end

end