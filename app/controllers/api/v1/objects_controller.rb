class API::V1::ObjectsController < ApplicationController

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

  def news
    restaurants =  Restaurant.where(new: true)
    data = restaurants.to_json(include: [:categoryitems, :addresses])

    response = { data: JSON(data),
                 result: {status: "SUCCESS",
                          message: ""} }

    render json: response
  end

  def rate
    restaurants =  Restaurant.where(rate: 4)
    data = restaurants.to_json(include: [:categoryitems, :addresses])

    response = { data: JSON(data),
                 result: {status: "SUCCESS",
                          message: ""} }

    render json: response
  end

  def open
    restaurants =  Restaurant.where(status: 'open')
    data = restaurants.to_json(include: [:categoryitems, :addresses])

    response = { data: JSON(data),
                 result: {status: "SUCCESS",
                          message: ""} }

    render json: response
  end

end