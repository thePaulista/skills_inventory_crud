require 'sequel'
require 'pry'

environments = ["test", "development"]

environments.each do |env|
  # binding.pry
  Sequel.sqlite("db/skill_inventory_#{env}.sqlite3").create_table(:skills) do
    primary_key :id
    String :title
    # binding.pry
    String :description
  end
end
