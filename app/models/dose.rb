class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient
  validates :cocktail, :ingredient, :description, presence:true
  validates :cocktail_id, uniqueness: {scope: :ingredient_id}
end
