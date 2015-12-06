require_relative '../test_helper'

class UserCanCreateANewRobotTest < FeatureTest

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

  def test_user_can_create_a_new_robot
    self.create_robots(3)
    # As a guest
    # When I visit the homepage
    visit "/"
    # And I click on create new robot
    click_link("Create New Robot")
    # And I fill out the new robot field
    assert_equal "/robots/new", current_path

    fill_in('robot[name]', :with => 'testbot_name')
    fill_in('robot[city]', :with => 'testbot_city')
    fill_in('robot[state]', :with => 'testbot_state')
    fill_in('robot[birthdate]', :with => 'testbot_birthdate')
    fill_in('robot[date_hired]', :with => 'testbot_date_hired')
    fill_in('robot[department]', :with => 'testbot_department')
    find('input[id="new_robot_form_submit"]').click
    
    assert_equal "/robots", current_path

    # And I click on the new robot's link in the robot index
    click_link("testbot_name")

    assert_equal "/robots/testbot_name", current_path

    # Then I can see all of the data on the new robot
    assert page.has_content?("testbot_name")
    assert page.has_content?("testbot_city")
    assert page.has_content?("testbot_state")
    assert page.has_content?("testbot_birthdate")
    assert page.has_content?("testbot_date_hired")
    assert page.has_content?("testbot_department")
  end
end