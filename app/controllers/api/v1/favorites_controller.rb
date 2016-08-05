class API::V1::FavoritesController < ApplicationController

  def index
    if params[:user_id]
      favorite_ids = Favorite.where(user_id: params[:user_id]).ids
      products = Product.find(favorite_ids)

      response = { data:    products,
                   result:  {status: 'SUCCESS',
                             message: ''} }

      render json: response
    elsif
    response = { data:    '',
                 result:  {status: 'ERROR',
                           message: 'parameter invalid'} }

      render json: response
    end
  end

  # def create
  #   if params[:user_id] && params[:product_id]
  #     Favorite.create(user_id: params[:user_id], product_id: params[:product_id], state: true)
  #
  #     response = { data:    '',
  #                  result:  {status: 'SUCCESS',
  #                            message: ''} }
  #
  #     render json: response
  #   elsif
  #   response = { data:    '',
  #                result:  {status: 'ERROR',
  #                          message: 'parameter invalid'} }
  #
  #     render json: response
  #   end
  # end

  def update
    if params[:user_id]
      favorite = Favorite.find_by(user_id: params[:user_id], product_id: params[:id])

      if favorite
        favorite.update(state: !favorite.state)
      else
        Favorite.create(user_id: params[:user_id], product_id: params[:id], state: true)
      end
      response = { data:    '',
                   result:  {status: 'SUCCESS',
                             message: ''} }

      render json: response
    elsif
    response = { data:    '',
                 result:  {status: 'ERROR',
                           message: 'parameter invalid'} }

      render json: response
    end
  end

end