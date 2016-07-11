class GetdataController < ApplicationController

  GET_ALL               = "get-data"

  def parse
    # deleteObjects

    response  = RestClient.get $ROOT_URL + GET_ALL
    response = getCorrectText(response)
    json = JSON.parse(response)

    categories    = json['categories']
    restaurants   = json['restaurants']
    shops         = json['shops']

    parseCategories(categories)
    parseRestaurants(restaurants)
    parseShops(shops)
    parseShopsInRestaurants()

    hasManyCategoriesRestaurants(categories, restaurants)

    # render nothing: true
    renderCategories
  end

  def getCorrectText(text)
    s = 22
    e = text.mb_chars.length - 1
    str = text[s...e]

    return str
  end

  def parseCategories(categories)
    if Category.all.count > 0
      categories.each do |category|
        cat = Category.find_by(category_id:  category['id'])

        cat.update(label:        category['label'],
                   title:        category['title'],
                   types:        category['type'],
                   position:     category['position'],
                   src:          category['src'])
      end
    else
      categories.each do |category|
        Category.create(category_id:  category['id'],
                        label:        category['label'],
                        title:        category['title'],
                        types:        category['type'],
                        position:     category['position'],
                        src:          category['src'])
      end
    end

  end

  def parseRestaurants(restaurants)
    if Restaurant.all.count > 0
      restaurants.each do |restaurant|
        res = Restaurant.find_by(restaurant_id:  restaurant['id'])
          if res
            res.update(restaurant_id:    restaurant['id'],
                       label:            restaurant['label'],
                       description:      restaurant['description'],
                       hash_:            restaurant['hash'],
                       status:           restaurant['status'],
                       position:         restaurant['position'],
                       budget:           restaurant['budget'],
                       openTime:         restaurant['openTime'],
                       closeTime:        restaurant['closeTime'],
                       src:              restaurant['src'],
                       min_amount_order: restaurant['min_amount_order'],
                       rate:             restaurant['rate'],
                       totalHours:       restaurant['totalHours'],
                       around:           restaurant['around'],
                       new:              restaurant['new'])
            end
      end
    else
      restaurants.each do |restaurant|
        Restaurant.create(restaurant_id:    restaurant['id'],
                          label:            restaurant['label'],
                          description:      restaurant['description'],
                          hash_:            restaurant['hash'],
                          status:           restaurant['status'],
                          position:         restaurant['position'],
                          budget:           restaurant['budget'],
                          openTime:         restaurant['openTime'],
                          closeTime:        restaurant['closeTime'],
                          src:              restaurant['src'],
                          min_amount_order: restaurant['min_amount_order'],
                          rate:             restaurant['rate'],
                          totalHours:       restaurant['totalHours'],
                          around:           restaurant['around'],
                          new:              restaurant['new'])
      end
    end

  end

  def parseShops(shops)
    if Shop.all.count > 0
      shops.each do |shop|
        s = Shop.find_by(shop_id:  shop['id'])
        if s
          s.update(shop_id:            shop['id'],
                   label:            shop['label'],
                   description:      shop['description'],
                   hash_:            shop['hash'],
                   status:           shop['status'],
                   position:         shop['position'],
                   budget:           shop['budget'],
                   openTime:         shop['openTime'],
                   closeTime:        shop['closeTime'],
                   src:              shop['src'],
                   min_amount_order: shop['min_amount_order'],
                   rate:             shop['rate'],
                   totalHours:       shop['totalHours'],
                   around:           shop['around'],
                   new:              shop['new'])
        end
      end
    else
      shops.each do |shop|
        Shop.create(shop_id:          shop['id'],
                    label:            shop['label'],
                    description:      shop['description'],
                    hash_:            shop['hash'],
                    status:           shop['status'],
                    position:         shop['position'],
                    budget:           shop['budget'],
                    openTime:         shop['openTime'],
                    closeTime:        shop['closeTime'],
                    src:              shop['src'],
                    min_amount_order: shop['min_amount_order'],
                    rate:             shop['rate'],
                    totalHours:       shop['totalHours'],
                    around:           shop['around'],
                    new:              shop['new'])
      end
    end

  end

  def parseShopsInRestaurants()
      Shop.all.each do |shop|
        r = Restaurant.find_by(restaurant_id:  shop.shop_id)
        if r.nil?
          Restaurant.create(restaurant_id:    shop.shop_id,
                            label:            shop.label,
                            description:      shop.description,
                            hash_:            shop.hash_,
                            status:           shop.status,
                            position:         shop.position,
                            budget:           shop.budget,
                            openTime:         shop.openTime,
                            closeTime:        shop.closeTime,
                            src:              shop.src,
                            min_amount_order: shop.min_amount_order,
                            rate:             shop.rate,
                            totalHours:       shop.totalHours,
                            around:           shop.around,
                            new:              shop.new)
        end
      end
    end

  def hasManyCategoriesRestaurants(categories, restaurants)

    categories.each_with_index do |category, index|
      cat = Category.find_by(category_id: category['id'])
      cat.restaurants.clear
      category['restaurants'].each do |id|
        if restaurant = Restaurant.find_by(restaurant_id: id)
          cat.restaurants << restaurant
        end
      end
    end

    restaurants.each do |restaurant|
      restaurant['categories'].each do |id|
        res = Restaurant.find_by(restaurant_id: restaurant['id'])
        category = Category.find_by(category_id: id)
        if category
          res.categories << category
        end
      end
    end
  end

  def renderCategories
    categories = Category.all

    render json: categories[0].restaurants
  end

  def renderRestaurants
    restaurants = Restaurant.all

    render json: restaurants
  end

  def deleteObjects
    Restaurant.delete_all
    Category.delete_all
  end

end
