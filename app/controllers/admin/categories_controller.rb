class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      redirect_to [:admin, :categories], flash: { error: @category.errors.full_messages.first }
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
