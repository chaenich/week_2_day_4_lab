class StarSystem

  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end


  def planet_names
    planet_array = []
    @planets.each do | planet |
      planet_array << planet.name
    end
    return planet_array
  end

  def get_planet_by_name(name)
    @planets.find do |planet|
      return planet if planet.name == name
    end
  end

  def get_largest_planet
    return(@planets.max_by do | planet |
      planet.diameter
    end)
  end

  def get_smallest_planet
    return(@planets.min_by do | planet |
      planet.diameter
    end)
  end

  def get_planets_with_no_moons
    return(
      @planets.find_all do |planet|
        planet.number_of_moons == 0
      end)
    end

    def get_planets_with_more_moons(number)
      planet_array = []
      @planets.each do | planet |
        planet_array << planet.name if planet.number_of_moons > number
      end
      return planet_array
    end

    def get_number_of_planets_closer_than(number)
      planet_array = []
      @planets.each do | planet |
        planet_array << planet.name if planet.distance_from_sun > number * 1000
      end
      return planet_array
    end
  end
