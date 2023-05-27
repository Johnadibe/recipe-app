class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  after_save :update_foods_counter, :update_foods_total_price
  before_destroy :decrement_foods_counter, :reduce_foods_total_price

  validates :quantity, presence: true, numericality: { only_integer: true }

  private

  def update_foods_counter
    recipe.increment!(:foods_counter)
  end

  def update_foods_total_price
    recipe.increment!(:foods_total_price, (food.price * quantity))
  end

  def reduce_foods_total_price
    recipe.decrement!(:foods_total_price, (food.price * quantity))
  end

  def decrement_foods_counter
    recipe.decrement!(:foods_counter)
  end
end
