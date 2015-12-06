require 'yaml/store'
require_relative 'robot'

class RobotWorld
  def self.database
    @database ||= YAML::Store.new("db/robot_world")
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['robots'] << {:name => robot[:name],
                             :city => robot[:city],
                             :state => robot[:state],
                             :birthdate => robot[:birthdate],
                             :date_hired => robot[:date_hired],
                             :department => robot[:department]
                            }
    end
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_robots.map { |data| Robot.new(data) }
  end

  def self.raw_robot(name)
    raw_robots.find { |robot| robot[:name] == name }
  end

  def self.find(name)
    Robot.new(raw_robot(name))
  end

  def self.update(name, robot)
    database.transaction do
      target = database['robots'].find { |data| data[:name] == name }
      target[:name] = robot[:name]
      target[:city] = robot[:city]
      target[:state] = robot[:state]
      target[:birthdate] = robot[:birthdate]
      target[:date_hired] = robot[:date_hired]
      target[:department] = robot[:department]
    end
  end

  def self.delete(name)
    database.transaction do
      database['robots'].delete_if { |robot| robot[:name] == name }
    end
  end

  def self.delete_all
    database.transaction do
      database['robots'] = []
    end
  end

end