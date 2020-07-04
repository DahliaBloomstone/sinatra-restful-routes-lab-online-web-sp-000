class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time
    end
  end
end


#rake db:create_migration NAME= create_recipes
#change file name
#rake db:migrate 
