class FoodsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @foods = Food.includes([:user]).all
  end

  def new
    @food = Food.new
  end

  def create
    food = current_user.foods.new(food_params)
    respond_to do |format|
      format.html do
        if food.save
          flash[:notice] = 'Food was saved successfully.'
          redirect_to foods_path
        else
          flash.now[:alert] = 'There was an error Creating the food. Please try again.'
          render :new
        end
      end
    end
  end

  def general
    @foods = current_user.foods
    current_user.recipes.map do |recipe|
      recipe.recipe_foods.includes(:food).map do |recipe_food|
        food = recipe_food.food
        test = @foods.select { |f| f.name == food.name }[0]
        test.quantity = test.quantity - recipe_food.quantity
      end
    end
    @foods = @foods.select { |f| f.quantity.negative? }
    @foods.each { |f| f.quantity *= -1 }
    @total = 0
    @foods.each do |food|
      @total += food.price * food.quantity
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      flash[:notice] = 'Food was deleted successfully.'
    else
      flash.now[:alert] = 'There was an error deleting the food.'
    end
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :quantity, :measurement_unit, :price)
  end
end
