require './lib/vehicle'
require './lib/passenger'
require './lib/park'

RSpec.describe Park do
  it "exists" do
    park1 = Park.new("Yellowstone", 15)
    park2 = Park.new("Rocky Mountain", 18)

    expect(park1).to be_a Park
    expect(park2).to be_a Park
  end

  it "has a name" do
    park1 = Park.new("Yellowstone", 15)
    park2 = Park.new("Rocky Mountain", 18)

    expect(park1.name).to eq("Yellowstone")
    expect(park2.name).to eq("Rocky Mountain")
  end

  it "has an admission price" do
    park1 = Park.new("Yellowstone", 15)
    park2 = Park.new("Rocky Mountain", 18)

    expect(park1.admission).to eq(15)
    expect(park2.admission).to eq(18)
  end

  it "can list all vehicles that enter the park" do
    park1 = Park.new("Yellowstone", 15)
    park2 = Park.new("Rocky Mountain", 18)
    vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle2 = Vehicle.new("2010", "Hyundai", "Sonata")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    chris = Passenger.new({"name" => "Chris", "age" => 30})
    vehicle1.add_passenger(charlie)
    vehicle1.add_passenger(jude)
    vehicle1.add_passenger(taylor)
    vehicle2.add_passenger(chris)

    expect(park1.entered).to eq([])

    park1.enter(vehicle1)
    park2.enter(vehicle2)

    expect(park1.entered).to eq([vehicle1])
    expect(park2.entered).to eq([vehicle2])
  end

  it "can list all passengers who have entered" do
    park1 = Park.new("Yellowstone", 15)
    park2 = Park.new("Rocky Mountain", 18)
    vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle2 = Vehicle.new("2010", "Hyundai", "Sonata")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    chris = Passenger.new({"name" => "Chris", "age" => 30})
    vehicle1.add_passenger(charlie)
    vehicle1.add_passenger(jude)
    vehicle1.add_passenger(taylor)
    vehicle2.add_passenger(chris)
    park1.enter(vehicle1)
    park2.enter(vehicle2)

    expect(park1.entrants).to eq([charlie, jude, taylor])
    expect(park2.entrants).to eq([chris])
  end

  it "can calculate revenue per adult passenger" do
    park1 = Park.new("Yellowstone", 15)
    park2 = Park.new("Rocky Mountain", 18)
    vehicle1 = Vehicle.new("2001", "Honda", "Civic")
    vehicle2 = Vehicle.new("2010", "Hyundai", "Sonata")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})
    chris = Passenger.new({"name" => "Chris", "age" => 30})
    vehicle1.add_passenger(charlie)
    vehicle1.add_passenger(jude)
    vehicle1.add_passenger(taylor)
    vehicle2.add_passenger(chris)
    park1.enter(vehicle1)
    park2.enter(vehicle2)

    expect(park1.revenue).to eq([30])
    expect(park2.revenue).to eq([18])
  end
end
