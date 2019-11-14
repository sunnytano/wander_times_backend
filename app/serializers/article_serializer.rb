class ArticleSerializer < ActiveModel::Serializer
  has_many :likes
  # has_many :reviews
  attributes :id, :title, :author, :overview, :url, :image, :category, :content
end
