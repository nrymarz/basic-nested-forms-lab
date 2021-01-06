class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: '', quantity: '')
    @recipe.ingredients.build(name: '', quantity: '')
  end

  def create
    recipe = Recipe.new(recipe_params)
    if !recipe.save
      render 'new'
    end
    redirect_to recipe_path(recipe)
  end

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes:[
        :name,
        :quantity
      ]
    )
  end
end
