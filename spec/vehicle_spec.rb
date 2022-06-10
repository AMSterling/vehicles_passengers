require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do
  it "exists" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle).to be_a Vehicle
  end

  it "has a year" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle.year).to eq("2001")
  end

  it "has a make" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle.make).to eq("Honda")
  end

  it "has a model" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle.model).to eq("Civic")
  end

  it "tracks its speed" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")

    expect(vehicle.speeding?).to be false

    vehicle.speed

    expect(vehicle.speeding?).to be true
  end

  it "carries passengers" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    expect(vehicle.passengers).to eq([])

    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)

    expect(vehicle.passengers).to eq([charlie, jude, taylor])
  end

  it "returns the number of passengers over 18" do
    vehicle = Vehicle.new("2001", "Honda", "Civic")
    charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    jude = Passenger.new({"name" => "Jude", "age" => 20})
    taylor = Passenger.new({"name" => "Taylor", "age" => 12})

    vehicle.add_passenger(charlie)
    vehicle.add_passenger(jude)
    vehicle.add_passenger(taylor)

    expect(vehicle.num_adults).to eq(2)
  end

end
