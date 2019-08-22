# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'activerecord-reset-pk-sequence'

# Article.destroy_all

require 'httparty'
require 'json'

# url = "https://newsapi.org/v2/everything?q=Apple&from=2019-08-13&sortBy=popularity&apiKey=#{key}"
# key = "f0a7beb8be6040cfadf7471e6a6676b4"
        request = HTTParty.get("https://newsapi.org/v2/everything?q=Tech&from=2019-08-13&sortBy=popularity&apiKey=f0a7beb8be6040cfadf7471e6a6676b4")
        @request_hash=JSON.parse(request.body)
            @request_hash["articles"].each do |article|
            Article.create(title: article["title"], author: article["author"], overview: article["description"], url: article["url"], image: article["urlToImage"])
            puts article["title"]
end 
