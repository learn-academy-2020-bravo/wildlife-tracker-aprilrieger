require "rails_helper"

RSpec.describe "Animal", :type => :request do

  it "is valid with valid attributes" do
    animal_test = Animal.create common_name: "Coastal tailed frog", latin_name: "Ascaphus truei", kingdom: "Animalia"
    expect(animal_test).to be_valid
  end

  it "is not valid without a common_name" do
    animal_common_name_test = Animal.create common_name: nil, latin_name: "Ascaphus truei", kingdom: "Animalia"
    expect(animal_common_name_test.errors[:common_name]).to_not be_empty
  end
 
  it "is not valid without a latin_name" do
    animal_latin_name_test = Animal.create common_name: "Coastal tailed frog", latin_name: nil, kingdom: "Animalia"
    expect(animal_latin_name_test.errors[:latin_name]).to_not be_empty
  end
  
  it "is not valid without a kingdom" do
    animal_kingdom_test = Animal.create common_name: "Coastal tailed frog", latin_name: "Ascaphus truei", kingdom: nil
    expect(animal_kingdom_test.errors[:kingdom]).to_not be_empty
  end

  it "cannot have the same value for common_name and latin_name" do
    animal_test = Animal.create common_name: "Coastal tailed frog", latin_name: "Coastal tailed frog", kingdom: "Animalia"
    expect(animal_test.errors[:common_name]).to_not be_empty
    expect(animal_test.errors[:latin_name]).to_not be_empty
  end

  it "must have a unique common_name" do
    animal_test_one = Animal.create common_name: "Coastal tailed frog", latin_name: "Ascaphus truei", kingdom: "Animalia"
    animal_test_two = Animal.create common_name: "Coastal tailed frog", latin_name: "Ascaphus truei", kingdom: "Animalia"
    expect(animal_test_two.errors[:common_name]).to_not be_empty
  end

  it "must have a unique latin_name" do
    animal_test_one = Animal.create common_name: "Coastal tailed frog", latin_name: "Ascaphus truei", kingdom: "Animalia"
    animal_test_two = Animal.create common_name: "Coastal tailed frog", latin_name: "Ascaphus truei", kingdom: "Animalia"
    expect(animal_test_two.errors[:latin_name]).to_not be_empty
  end

end