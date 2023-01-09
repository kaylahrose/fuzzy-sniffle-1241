class DishController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def create
    chef = Chef.find(params[:chef_id])
    chef.dishes.create(dish_params)
    redirect_to chef_path(chef)
  end

private
  def dish_params
    params.permit(:name, :description)
  end
end