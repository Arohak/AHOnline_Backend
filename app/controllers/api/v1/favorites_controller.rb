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

  def create
    if params[:user_id] && params[:product_id]
      Favorite.create(user_id: params[:user_id], product_id: params[:product_id])

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

  def destroy
    if params[:user_id]
      Favorite.find_by(user_id: params[:user_id], product_id: params[:id]).destroy

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