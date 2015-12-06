require './app/models/robot_world'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get "/" do
    erb :dashboard
  end

  get "/robots" do
    @robots = RobotWorld.all
    erb :index
  end

  get "/robots/new" do
    erb :new
  end

  post "/robots" do
    RobotWorld.create(params[:robot])
    redirect "/robots"
  end

  get "/robots/:name" do |name|
    @robot = RobotWorld.find(name)
    erb :show
  end

  not_found do
    erb :error
  end

  get "/robots/:name/edit" do |name|
    @robot = RobotWorld.find(name)
    erb :edit
  end

  put "/robots/:name" do |name|
    RobotWorld.update(name, params[:robot])
    new_name = params[:robot][:name]
    redirect "/robots/#{new_name}"
  end

  delete "/robots/:name" do |name|
    RobotWorld.delete(name)
    redirect "/robots"
  end

end