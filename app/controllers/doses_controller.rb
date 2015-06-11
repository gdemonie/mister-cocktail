class DosesController < ApplicationController

  before_action :find_cocktail, only: [:new, :create]

  def new
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    pars = dose_params.merge({cocktail_id: params[:cocktail_id]})
    @dose = Dose.new(pars)
    #@dose = @cocktail.doses.create(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
