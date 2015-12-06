require_relative '../test_helper'

class UserCanDeleteARobotTest < FeatureTest

  def create_robots(num)
    num.times do |n|
      RobotWorld.create({ :name => "#{n+1}name",
                          :city => "#{n+1}city",
                          :state => "#{n+1}state",
                          :birthdate => "#{n+1}birthdate",
                          :date_hired => "#{n+1}date_hired",
                          :department => "#{n+1}department"
                        })
    end
  end

  def test_user_can_delete_a_robot
    self.create_robots(1)
    # As a guest
    # When I visit the homepage
    visit "/"
    # And I click on robot index robot
    click_link("Robot Index")
    assert_equal "/robots", current_path
    # And I see that robot "1name" exists
    assert page.has_content?("1name")
    # And I click 'delete' for "1name"
    find('input[name="delete_robot_button"]').click
    assert_equal "/robots", current_path
    # Then the robot is deleted
    refute page.has_content?("1name")
  end
end