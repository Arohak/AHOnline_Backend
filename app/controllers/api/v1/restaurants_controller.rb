class API::V1::RestaurantsController < ApplicationController

  def index
    restaurants =  Restaurant.all.limit(params[:limit])
    data = restaurants.to_json(include: [:categoryitems, :addresses])

    response = { data: JSON(data),
                 result: {status: "SUCCESS",
                          message: ""} }

    render json: response
  end

  def show
    restaurant = Restaurant.find(params[:id])
    data = restaurant.to_json(include: [:categoryitems, :addresses])

    response = { data:    JSON(data),
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

end