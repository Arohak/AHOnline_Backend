class API::V1::SubcategoriesController < ApplicationController

  def index
    subcategories = Subcategory.where(category_id: params[:category_id])
    response = { data:    subcategories,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def show
    restaurants = Subcategory.find(params[:id]).restaurants.limit(params[:limit]).offset(params[:offset])
    response = { data:    restaurants,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

end