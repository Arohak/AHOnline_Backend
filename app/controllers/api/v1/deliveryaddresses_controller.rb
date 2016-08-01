class API::V1::DeliveryaddressesController < ApplicationController

  def index
    addresses = Deliveryaddress.all
    response = { data:    addresses,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def update
    address = Deliveryaddress.find(params[:id])
    address.update_attributes(user_id: params[:user_id],
                              country: params[:country],
                              city:    params[:city],
                              address: params[:address],
                              def:     params[:def])

    response = { data:    address,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def create
    address = Deliveryaddress.create(user_id: params[:user_id],
                                     country: params[:country],
                                     city:    params[:city],
                                     address: params[:address],
                                     def:     params[:def])

    response = { data:    address,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

end