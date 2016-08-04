class Get::ParsealltranslationController < ApplicationController

  def parse
    url = $ROOT_URL + GET_ALL + "?lng=#{params[:lng]}"
    response  = RestClient.get url
    response = getCorrectText(response)
    json = JSON.parse(response)

    subcategories  = json['categories']
    restaurants    = json['restaurants']
    shops          = json['shops']

    parseSubcategories(subcategories)
    parseRestaurants(restaurants)
    parseShops(shops)

    render text: 'OK'
  end

  def getCorrectText(text)
    s = 22
    e = text.mb_chars.length - 1
    str = text[s...e]

    return str
  end

  def parseSubcategories(subcategories)
    subcategories.each do |subcategory|
      cat = Subcategory.find_by(subcategory_id:  subcategory['id'])

      cat.update_attributes(name:   subcategory['label'],
                            title:  subcategory['title'])
    end
  end

  def parseRestaurants(restaurants)
    restaurants.each do |restaurant|
      res = Restaurant.find_by(restaurant_id:  restaurant['id'])
      if res
        res.update_attributes(label:        restaurant['label'],
                              description:  restaurant['description'])
      end
    end
  end

  def parseShops(shops)
    shops.each do |shop|
      s = Shop.find_by(shop_id:  shop['id'])
      if s
        s.update_attributes(label:        shop['label'],
                            description:  shop['description'])
      end
    end
  end

end
