class UserSerializer < ActiveModel::Serializer
  has_many :likes
  # has_many :articles
  attributes :id, :username, :password_digest, :email, :avatar
end
