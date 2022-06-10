class Park
  attr_reader :name, :admission, :entered

  def initialize(name, admission)
    @name = name
    @admission = admission
    @entered = []
  end

  def enter(car)
    @entered << car
  end

  def entrants
    @entered.flat_map do |entrant|
      entrant.passengers
    end
  end

  def revenue
    @entered.map do |entrant|
      entrant.num_adults * admission
    end
  end
end
