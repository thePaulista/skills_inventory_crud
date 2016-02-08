class SkillInventory
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(skill)
    dataset.insert(skill)
  end

  def all
    dataset.map {|data| Skill.new(data)}
  end

  def dataset
    database.from(:skills)
  end

  def find(id)
    data = dataset.where(:id => id).to_a.first
    Skill.new(data)
  end

  def update(skill, id)
    dataset.where(:id => id).update(skill)
  end

  def delete(id)
    dataset.where(:id => id).delete
    # binding.pry
  end

  def find_by(input)
    dataset.where(input).map {|t| Skill.new(t)}
  end
end
