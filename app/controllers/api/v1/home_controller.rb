class API::V1::HomeController < ApplicationController

  def index
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

end