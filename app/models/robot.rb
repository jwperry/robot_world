class Robot
  attr_reader :name, :city, :state, :birthdate, :date_hired, :department

  def initialize(data)
    @name = data[:name]
    @city = data[:city]
    @state = data[:state]
    @birthdate = data[:birthdate]
    @date_hired = data[:date_hired]
    @department = data[:department]
  end

end