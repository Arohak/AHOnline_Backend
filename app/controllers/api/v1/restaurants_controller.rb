class API::V1::RestaurantsController < ApplicationController

  def index
    l       = params[:limit]
    o       = params[:offset]
    type    = params[:type]

    case type
      when 'new'
        @restaurants =  Restaurant.where(new: true).limit(l).offset(o)
      when 'rate'
        @restaurants =  Restaurant.where(rate: 4).limit(l).offset(o)
      when 'open'
        @restaurants =  Restaurant.where(status: 'open').limit(l).offset(o)
      when 'all'
        @restaurants =  Restaurant.all.limit(l).offset(o)
      when nil
        @restaurants =  Restaurant.all
    end

    data = @restaurants.to_json(include: [:categoryitems, :addresses])

    response = { data: JSON(data),
                 result: {status: "SUCCESS",
                          message: ""} }

    render json: response
  end

  def show
    restaurant = Restaurant.find(params[:id])
    data = restaurant.to_json(include: [:categoryitems, :addresses])

    response = { data:    JSON(data),
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def nearst
    latitude  = params[:latitude].to_s.to_d
    longitude = params[:longitude].to_s.to_d
    m         = params[:km].to_s.to_d * 1000

    restaurants = Array.new
    addresses = Array.new

    Restaurant.all.each do |restaurant|
      addresses.clear

      restaurant.addresses.each do |address|
        unless address.nil? && address.nil?
          meter = distance_between(latitude, longitude, address.latitude, address.longitude)
          if !meter.nil? && meter < m
            add = address.dup
            add.update(distance: meter)
            addresses << add
          end
        end
      end

      if !addresses.empty?
        rest = restaurant.dup
        rest.update(id: restaurant.id)
        rest.addresses = addresses
        restaurants << rest
      end

    end

    data = restaurants.to_json(include: [:categoryitems, :addresses])

    response = { data:    JSON(data),
                 result:  {status: "SUCCESS",
                           message: ""} }

    render json: response
  end

  def distance_between(lat1, lon1, lat2, lon2)
    rad_per_deg = Math::PI / 180
    rm = 6371000 # Earth radius in meters

    lat1_rad, lat2_rad = lat1 * rad_per_deg, lat2 * rad_per_deg
    lon1_rad, lon2_rad = lon1 * rad_per_deg, lon2 * rad_per_deg

    a = Math.sin((lat2_rad - lat1_rad) / 2) ** 2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin((lon2_rad - lon1_rad) / 2) ** 2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))

    rm * c # Delta in meters
  end

end