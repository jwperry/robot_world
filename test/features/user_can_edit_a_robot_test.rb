require_relative '../test_helper'

class UserCanEditARobotTest < FeatureTest

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

  def test_user_can_edit_a_robot
    self.create_robots(1)
    # As a guest
    # When I visit the homepage
    visit "/"
    # And I click on robot index robot
    click_link("Robot Index")
    assert_equal "/robots", current_path
    # And I click 'edit' for an existing robot "1name"
    click_link("Edit")
    assert_equal "/robots/1name/edit", current_path

    fill_in('robot[name]', :with => '1name_edit')
    fill_in('robot[city]', :with => '1city_edit')
    fill_in('robot[state]', :with => '1state_edit')
    fill_in('robot[birthdate]', :with => '1birthdate_edit')
    fill_in('robot[date_hired]', :with => '1date_hired_edit')
    fill_in('robot[department]', :with => '1department_edit')
    find('input[name="edit_robot_form_submit"]').click
    
    assert_equal "/robots/1name_edit", current_path

    # Then I can see all of the new data on the edited robot
    assert page.has_content?("1name_edit")
    assert page.has_content?("1city_edit")
    assert page.has_content?("1state_edit")
    assert page.has_content?("1birthdate_edit")
    assert page.has_content?("1date_hired_edit")
    assert page.has_content?("1department_edit")
  end
end