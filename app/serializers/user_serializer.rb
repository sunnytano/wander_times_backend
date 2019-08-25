class UserSerializer < ActiveModel::Serializer
  # has_many :likes
  # has_many :reviews
  attributes :username, :password_digest, :email
end
