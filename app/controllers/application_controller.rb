class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @recipes = Recipe.all
    erb :index
  end

#Index action to display all recipes
#allows the view to access all the recipes in the database through instance variable recipes.
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

#new action to display create recipe form
#GET request to load the form to create a new recipe
  get '/recipes/new' do
    erb :new
  end

#create action that creates one recipe
#responds to a POST request and creates a new article based on the params from the form and saves it to the database.
#once item is created, action reidrects to the show page.
  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

#show action that displays one recipe based on the ID in the URL
#uses A DYNAMIC URL. we can access the ID of the recipe in the view through the params hash
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

#edit action that displays edit form based on ID in the url
#loads the edit form in the browser 
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

#update action that modfiies an existing recipe based on the ID in the url
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

#deletes one article based on id in the URL
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to :index
  end

end
