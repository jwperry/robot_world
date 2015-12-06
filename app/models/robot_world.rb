class RobotWorld
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/robot_world_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_world_development.sqlite3")
    end
  end

  def self.create(robot)
    dataset.insert(robot)
  end

  def self.all
    robots = dataset.to_a
    robots.map { |data| Robot.new(data) }
  end

  def self.find(name)
    robot = dataset.where(:name => name).to_a.first
    Robot.new(robot)
  end

  def self.update(name, robot_data)
    robot = dataset.where(:name => name)
    robot.update(robot_data)
  end

  def self.delete(name)
    dataset.where(:name => name).delete
  end

  def self.delete_all
    dataset.from(:robots).delete
  end

  def self.dataset
    database.from(:robots)
  end

end