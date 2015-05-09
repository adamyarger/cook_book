class RecipesController < ApplicationController

	before_action :authenticate_user!, only: [:create, :update, :destroy]

	def create
		@recipe = current_user.recipes.build(recipe_params)

		if @recipe.save
			flash[:success] = "Recipe Created!"
			redirect_to @recipe
		else
			flash[:alert] = "Somthing went wrong"
			render 'static_pages/root'
		end
	end

	def index
		@recipes = Recipe.all
	end

	def new
		@recipe = Recipe.new
	end

	def update
		
	end

	def destroy
		
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	private

		def recipe_params
			params.require(:recipe).permit(:title, :description, :ingredients, :time, :directions, :servings)
		end

end
