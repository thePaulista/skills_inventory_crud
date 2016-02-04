# require 'models/skill_inventory'

class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get '/skills' do
    @skills = skill_inventory.all
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    skill_inventory.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skills = skill_inventory.find(id.to_i)
    erb :show
  end

  get '/skills/:id/edit' do |id|
    @skills = skill_inventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    skill_inventory.update(params[:task], id)
    redirect "/skills/#{id}"
  end

  delete "/skills/:id" do |id|
    skill_inventory.delete(id.to_i)
    redirect '/skills'
  end

  def skill_inventory
    database = YAML::Store.new('db/skills_inventory')
    @skill_inventory ||= SkillInventory.new(database)
  end
end
