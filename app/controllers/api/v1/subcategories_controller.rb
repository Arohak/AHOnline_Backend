class API::V1::SubcategoriesController < ApplicationController

  def index
    subcategories = Subcategory.where(category_id: params[:category_id])
    response = { data:    subcategories,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def show
    subcategory = Subcategory.find(params[:id])
    data = subcategory.to_json(include: :restaurants)
    response = { data:    JSON(data),
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

end