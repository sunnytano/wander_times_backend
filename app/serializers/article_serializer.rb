class ArticleSerializer < ActiveModel::Serializer
  has_many :likes
  has_many :reviews
  attributes :title, :author, :overview, :url, :image
end
