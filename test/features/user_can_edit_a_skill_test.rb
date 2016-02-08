require_relative '../test_helper'

class UserCanEditAnExistingSkill < FeatureTest
  def test_existing_skill_is_updated_with_new_skill

    skill_inventory.create({
      title: 'old title',
      description: 'old description'
      })

    id = skill_inventory.all.last.id

    visit "/skills/#{id}/edit"

    fill_in 'skill[title]', with: 'new title'
    fill_in 'skill[description]', with: 'new description'
    click_button 'Resubmit skill'

    assert_equal "/skills/#{id}", current_path
    within '#skill' do
      assert page.has_content? 'new title'

    end
    within 'p' do
      assert page.has_content? 'new description'
    end
  end

end
