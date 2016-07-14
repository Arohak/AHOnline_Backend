class API::V1::ProductsController < ApplicationController

  def index
    product = Product.where(categoryitem_id: params[:categoryitem_id])
    response = { data:    product,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def show

  end

end