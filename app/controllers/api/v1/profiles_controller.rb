class API::V1::ProfilesController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    users = Profiles.all
    response = { data:    users,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def show
    user = Profiles.find(params[:id])
    response = { data:    user,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def create
    user = Profiles.new(mobile_number: params[:mobile_number])
    user.save

    response = { data:    user,
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def user_params
    params.require(:@user)
  end

end