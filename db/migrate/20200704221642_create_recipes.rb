class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time
    end
  end
end

#create a table in the database to store the recipes
#recipes have a: name, ingredients, and cook time
#rake db:create_migration NAME= create_recipes
#change file name
#rake db:migrate
#run rake db:migrate SINATRA_ENV=test
