require_relative '../test_helper'

class SkillTest < Minitest::Test

  def test_skill_attributes_assigned_correctly
    data = {
      :id => 1,
      :title => "my skill",
      :description => "something"
    }

    skill = Skill.new(data)

    assert_equal 1, skill.id
    assert_equal "my skill", skill.title
    assert_equal "something", skill.description
  end
end
