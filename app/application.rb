class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    Item.new("Figs",3.42)
    Item.new("Pears",0.99)

    
    if req.path.match(/items/)
      search_term = req.path.split("/items/").last
      
      result = Item.items.find{|item| item.name == search_term}
      if result != nil
    
        resp.write "#{result.price}" 
        resp.status = 200
      else 
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end  
    resp.finish
  end
  
end
