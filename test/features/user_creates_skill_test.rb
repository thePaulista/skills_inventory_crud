require_relative '../test_helper'

class UserCreatesSkillTest < Minitest::Test
  include Capybara::DSL

  def test_with_valid_attributes
    #as a user
    #when I visit the home page
    visit '/'
    #and I click "newSkill:"
    click_link('New Skill')
    #and I fill in the title
    # fill_in('skill[title]', with: "My new skill")
    #and I fill in the description
    fill_in('skill[description]', with: 'so much skill')
    #and I click Submit
    click_button 'Submit'
    #then I should see my task
    assert_equal "/skills", current_path
    within("#skills") do
      assert page.has_content?('My new skill')
    end
  end
end
