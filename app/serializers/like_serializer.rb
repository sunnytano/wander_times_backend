class LikeSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :article
  attributes :id, :user_id, :article_id, :article
end
