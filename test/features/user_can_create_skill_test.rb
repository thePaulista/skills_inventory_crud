require_relative '../test_helper'

class UserCanCreateSkillTest < FeatureTest

  def test_skill_creates_with_valid_attributes
    #as a user
    #when I visit the home page
    visit '/skills/new'
    #and I fill in title text
    fill_in 'skill[title]', with: 'My new skill'
    fill_in 'skill[description]', with: 'so much skill'
    #and I click Submit
    click_button 'Submit'
    #then I should see my task
    assert_equal "/skills", current_path

    within("#skills") do
      assert page.has_content?('My new skill')
    end
  end
end
