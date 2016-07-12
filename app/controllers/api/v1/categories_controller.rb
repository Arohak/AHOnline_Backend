class API::V1::CategoriesController < ApplicationController

  def index
    categories = Category.all
    data = categories.to_json(include: :subcategories, except: [:created_at, :updated_at])
    response = { data:    JSON(data),
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def show
    category = Category.find(params[:id])
    data = category.to_json(include: :subcategories, except: [:created_at, :updated_at])
    response = { data:    JSON(data),
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

end