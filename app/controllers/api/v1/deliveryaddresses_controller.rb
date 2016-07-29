class API::V1::DeliveryaddressesController < ApplicationController

  def index
    addresses = Deliveryaddress.all
    response = { data:    addresses,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def show
    address = Deliveryaddress.find(params[:id])
    response = { data:    address,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

end