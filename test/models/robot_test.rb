require_relative '../test_helper'
require_relative '../../app/models/robot.rb'

class RobotTest < Minitest::Test 
  def test_attributes_are_assigned_correctly
    robot = Robot.new({ :name => "Bender",
                        :city => "Tijuana",
                        :state => "Mexico",
                        :birthdate => "12/31/2999",
                        :date_hired => "01/01/3000",
                        :department => "Bending"
                     })

    assert_equal "Bender", robot.name
    assert_equal "Tijuana", robot.city
    assert_equal "Mexico", robot.state
    assert_equal "12/31/2999", robot.birthdate
    assert_equal "01/01/3000", robot.date_hired
    assert_equal "Bending", robot.department
  end
end