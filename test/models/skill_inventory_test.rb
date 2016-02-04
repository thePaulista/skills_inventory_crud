require_relative "../test_helper"

class SkillInvetoryTest <Minitest::Test
  include TestHelpers

  def test_can_create_a_skill
    data = {
      title: "some title",
      description: "some description"
    }

    skill_inventory.create(data)

    skill = skill_inventory.all.last
    #gets the last item from the array

    assert skill.id
    assert_equal "some title", skill.title
    assert_equal "some description", skill.description
  end

  def test_all_can_create_an_array_of_skill
    data1 = {
      title: "some title",
      description: "new description"
    }

    data2 = {
      title: "new title",
      description: "new description"
    }

    d1 = skill_inventory.create(data1)
    d2 = skill_inventory.create(data2)

    assert_equal 2, skill_inventory.all.count
  end

  def test_it_can_locate_by_id
    data1 = {
      title: "some title",
      description: "some description"
    }

    data2 = {
      title: "new title",
      description: "new description"
    }

    skill_inventory.create(data1)
    skill_inventory.create(data2)

    assert_equal "some title", skill_inventory.find(1).title
    assert_equal "new title", skill_inventory.find(2).title
  end

end
