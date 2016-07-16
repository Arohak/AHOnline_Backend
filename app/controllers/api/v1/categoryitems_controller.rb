class API::V1::CategoryitemsController < ApplicationController

  def index
    categoryitems = Categoryitem.where(restaurant_id: params[:restaurant_id])
    response = { data:    categoryitems,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def show

  end

end