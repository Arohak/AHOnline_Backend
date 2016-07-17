class API::V1::RestaurantsController < ApplicationController

  def home
    news =  Restaurant.where(new: true).limit(5)
    rates =  Restaurant.where(rate: 4).limit(5)
    opens =  Restaurant.where(status: 'open').limit(5)

    response = { data: {news: news,
                        rates: rates,
                        opens: opens},

                 result: {status: "SUCCESS",
                          message: ""} }

    render json: response
  end

  def show
    restaurant = Restaurant.find(params[:id])
    data = restaurant.to_json(include: :categoryitems, except: [:created_at, :updated_at])
    response = { data:    JSON(data),
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

end