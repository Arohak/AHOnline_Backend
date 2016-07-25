class API::V1::ProductsController < ApplicationController

  def index
    l       = params[:limit]
    o       = params[:offset]
    type    = params[:type]

    case type
      when 'restaurant'
        @products =  Product.where(restaurant: 'restaurant').limit(l).offset(o)
      when 'shop'
        @products =  Product.where(shop: 'shop').limit(l).offset(o)
      when nil
        if params[:categoryitem_id]
          @products = Product.where(categoryitem_id: params[:categoryitem_id]).limit(l).offset(o)
        elsif params[:search]
          @products = Product.search(params[:search]).limit(l).offset(o)
        else
          @products = Product.all.limit(l).offset(o)
        end
    end

    response = { data:    @products,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def show

  end

end