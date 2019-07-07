class IngredientsController < ApplicationController
  before_action :find_ingredient_to_cocktail, :only [:new, :create]

  def show

  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient.save
  end

  # ------------------------------------------------

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

  def find_ingredient_to_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
