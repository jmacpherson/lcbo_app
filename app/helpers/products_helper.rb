module ProductsHelper

  def total_pages
    products_json = open("http://lcboapi.com/products").read
    page = JSON.parse(products_json)
    page['pager']['final_page']
  end
end
