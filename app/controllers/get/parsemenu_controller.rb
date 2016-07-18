class Get::ParsemenuController < ApplicationController

  GET_CATEGORY_ITEMS    = 'get-restaurant-menu-categories?rest='

  def parse
    Restaurant.all.each do |r|
      response  = RestClient.get $ROOT_URL + GET_CATEGORY_ITEMS + r.restaurant_id.to_s
      response = getCorrectText(response)
      json = JSON.parse(response)
      categories  = json['categories']

      parseCategoryitems(r, categories)
    end

    render text: 'OK'
  end

  def getCorrectText(text)
    s = 22
    e = text.mb_chars.length - 1
    str = text[s...e]

    return str
  end

  def parseCategoryitems(restaurant, categoryitems)
    categoryitems.each do |categoryitem|
      Categoryitem.create(categoryitem_id:  categoryitem['id'],
                          rest_id:          categoryitem['restaurant_menu_categories'],
                          restaurant_id:    restaurant.id,
                          name:             categoryitem['label'])
    end
  end

end
