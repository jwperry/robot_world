require_relative '../test_helper'
require_relative '../../app/models/robot_world.rb'

class RobotWorldTest < Minitest::Test
  def create_robots(num)
    num.times do |i|
      RobotWorld.create({ :name => "#{i+1} name",
                          :city => "#{i+1} city",
                          :state => "#{i+1} state",
                          :birthdate => "#{i+1} birthdate",
                          :date_hired => "#{i+1} date_hired",
                          :department => "#{i+1} department"
                       })
    end
  end

  def test_it_creates_a_robot
    create_robots(1)

    robot = RobotWorld.all.last

    assert_equal "1 name", robot.name
    assert_equal "1 city", robot.city
    assert_equal "1 state", robot.state
    assert_equal "1 birthdate", robot.birthdate
    assert_equal "1 date_hired", robot.date_hired
    assert_equal "1 department", robot.department
    assert_equal RobotWorld.all.first.name, robot.name
  end

  def test_it_finds_all_robots
    create_robots(2)

    assert_equal 2, RobotWorld.all.count
  end

  def test_it_finds_a_robot_by_name
    create_robots(2)

    name = RobotWorld.all.last.name

    assert_equal "2 name", RobotWorld.find(name).name
  end

  def test_it_updates_a_robot
    create_robots(1)
    name = RobotWorld.all.last.name

    RobotWorld.update(name, {:name => "new name",
                             :city => "new city",
                             :state => "new state",
                             :birthdate => "new birthdate",
                             :date_hired => "new date_hired",
                             :department => "new department"
                            })

    name = RobotWorld.all.first.name
    robot = RobotWorld.find(name)

    assert_equal "new name", robot.name
    assert_equal "new city", robot.city
    assert_equal "new state", robot.state
    assert_equal "new birthdate", robot.birthdate
    assert_equal "new date_hired", robot.date_hired
    assert_equal "new department", robot.department
  end

  def test_it_deletes_a_robot
    create_robots(3)
    total = RobotWorld.all.count

    RobotWorld.delete(RobotWorld.all.first.name)

    assert_equal (total - 1), RobotWorld.all.count
  end
end