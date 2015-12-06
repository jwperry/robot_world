require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest

  def create_robots(num)
    num.times do |n|
      RobotWorld.create({ :name => "#{n+1} name",
                          :city => "#{n+1} city",
                          :state => "#{n+1} state",
                          :birthdate => "#{n+1} birthdate",
                          :date_hired => "#{n+1} date_hired",
                          :department => "#{n+1} department"
                        })
    end
  end

  def test_user_sees_index_of_robots
    self.create_robots(3)
    # As a guest
    # When I visit the home page
    visit "/"
    # And I click on robot index
    click_link("Robot Index")
    # Then I see all robots
    within("#robot_index") do
      assert page.has_content?("1 name")
      assert page.has_content?("2 name")
      assert page.has_content?("3 name")
    end
  end
end