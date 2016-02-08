require_relative '../test_helper'

class UserSeesAllSkillsTest <FeatureTest
  include TestHelpers

  def create_skills(num)
    num.times do |i|
      skill_inventory.create(
      title:  "title#{i+1}",
      description: "description#{i+1}"
      )
    end
  end

  def test_a_user_can_see_a_single_skill
    create_skills(1)
    skill = skill_inventory.all.last

    visit "/skills"

    click_link("title1")
    assert_equal "/skills/#{skill.id}", current_path
    assert page.has_content?("description1")
  end

  def test_filter_skill_index_by_param
    create_skills(1)

    skill_inventory.create({
      :title => "eating",
      :description => "til full"
      })

    skill_inventory.create({
      :title => "coding",
      :description => "happily"
      })

    visit "/skills?title=eating"

    selected_skills = skill_inventory.all.select {|skill| skill.title == "eating"}

    selected_skills.each do |skill|
      within("#skill-#{skill.id}") do
        assert page.has_content?("eating")
      end
    end

    refute page.has_content?('lol')
  end
end
