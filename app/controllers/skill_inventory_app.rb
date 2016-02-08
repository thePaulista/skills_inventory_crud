# require 'skill_inventory'
class SkillInventoryApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/skills' do
    if params[:title]
      @skills = skill_inventory.find_by(title: params[:title])
    else
      @skills = skill_inventory.all
    end
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    skill_inventory.create(params[:skill])
    # binding.pry
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = skill_inventory.find(id)
    erb :show
  end

  get '/skills/:id/edit' do |id|
    @skill = skill_inventory.find(id)
    erb :edit
  end

  put '/skills/:id' do |id|
    skill_inventory.update(params[:skill], id.to_i)
    redirect "/skills/#{id}"
  end

  delete "/skills/:id" do |id|
    skill_inventory.delete(id.to_i)
    # binding.pry
    redirect "/skills"
  end

  not_found do
    erb :error
  end

def skill_inventory
    if ENV["RACK_ENV"] == "test"
      database = Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      database = Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
    @skill_inventory ||= SkillInventory.new(database)
  end
end
