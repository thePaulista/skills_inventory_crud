require_relative "../test_helper"

class SkillInvetoryTest <Minitest::Test
  include TestHelpers

  def create_skills(num)
    num.times do |i|
      skill_inventory.create(
      title: "title #{i+1}",
      description: "description #{i+1}"
      )
    end
  end

  def test_can_create_a_skill
    skill_inventory.create(
    title: "title1",
    description: "description1"
    )

    skill = skill_inventory.all.last
binding.pry
    assert skill.id
    assert_equal "title1", skill.title
    assert_equal "description1", skill.description1
  end

end



#   def test_can_create_a_skill
#     data = {
#       title: "some title",
#       description: "some description"
#     }
#
#     skill_inventory.create(data)
#
#     skill = skill_inventory.all.last
#     #gets the last item from the array
#
#     assert skill.id
#     assert_equal "some title", skill.title
#     assert_equal "some description", skill.description
#   end
#
#   def test_all_can_create_an_array_of_skill
#     data1 = {
#       title: "some title",
#       description: "new description"
#     }
#
#     data2 = {
#       title: "new title",
#       description: "new description"
#     }
#
#     skill_inventory.create(data1)
#     skill_inventory.create(data2)
#
#     assert_equal 2, skill_inventory.all.count
#   end
#
#   def test_it_can_locate_by_id
#     data1 = {
#       title: "some title",
#       description: "some description"
#     }
#
#     data2 = {
#       title: "new title",
#       description: "new description"
#     }
#
#     skill_inventory.create(data1)
#     skill_inventory.create(data2)
#
#     assert_equal "some title", skill_inventory.find(1).title
#     assert_equal "new title", skill_inventory.find(2).title
#   end
#
# end
