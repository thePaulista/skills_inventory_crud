require_relative '../test_helper'

class UserCanDeleteAnExistingSkill < FeatureTest
  def test_existing_skill_can_be_deleted
    skill_inventory.create({
      title: "old title",
      description: "old description"
      })

      visit '/skills'

      assert page.has_content? 'old title'

      click_button 'Delete'

      within '#skills' do
        refute page.has_content? 'old title'
      end
    end
end
