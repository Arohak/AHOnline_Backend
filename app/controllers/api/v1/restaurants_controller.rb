class API::V1::RestaurantsController < ApplicationController

  def index
    l       = params[:limit]
    o       = params[:offset]
    type    = params[:type]

    case type
      when 'new'
        @restaurants =  Restaurant.where(new: true).limit(l).offset(o)
      when 'rate'
        @restaurants =  Restaurant.where(rate: 4).limit(l).offset(o)
      when 'open'
        @restaurants =  Restaurant.where(status: 'open').limit(l).offset(o)
      when 'all'
        @restaurants =  Restaurant.all.limit(l).offset(o)
      when nil
        @restaurants =  Restaurant.all
    end

    data = @restaurants.to_json(include: [:categoryitems, :addresses])

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