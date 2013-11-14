class API
  require 'open-uri'
  def self.get_pages(start_page, end_page)
    unless start_page.nil? or end_page.nil?
      start_page = start_page.to_i
      end_page = end_page.to_i
      if start_page > end_page
        temp = start_page
        start_page = end_page
        end_page = temp
      end
      pages = []
      products_json = open("http://lcboapi.com/products?page=#{start_page}").read
      pages << JSON.parse(products_json)
      start_page += 1
      while start_page <= end_page do
        products_json = open("http://lcboapi.com/products?page=#{start_page}").read
        pages << JSON.parse(products_json)
        start_page +=1
      end
      return pages
    end
  end 

  def self.get_category(category)
    
  end

end

