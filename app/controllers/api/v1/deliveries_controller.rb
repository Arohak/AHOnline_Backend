class API::V1::DeliveriesController < ApplicationController

  def index
    delivery = Delivery.all
    response = { data:    delivery,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def show

  end

end