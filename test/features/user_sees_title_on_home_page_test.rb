require_relative '../test_helper'

class UserSeesTitleOnHomePageTest < FeatureTest
  def test_user_sees_index_of_robots
    # As a guest
    # When I visit the homepage
    visit "/"
    # Then I see "ROBOT WORLD" displayed
    within("#greeting") do
      assert page.has_content?("ROBOT WORLD")
    end
  end
end