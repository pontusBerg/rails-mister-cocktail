class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save

    redirect_to new_cocktail_dose_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path(@cocktail)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end


