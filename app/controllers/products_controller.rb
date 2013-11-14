require 'lcbo_api'
require 'open-uri'

class ProductsController < ApplicationController
  
  def index
    @start_page = params[:start_page]
    @end_page = params[:end_page]
    @products = API.get_pages(@start_page, @end_page)
  end

  def show
    id = params[:id]
    products_json = open('http://lcboapi.com/products').read
    products = JSON.parse(products_json)
    products['result'].each do |product|
      @product = product if product['id'].to_i == id.to_i
    end
  end

end
