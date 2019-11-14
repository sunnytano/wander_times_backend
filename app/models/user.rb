class User < ApplicationRecord
    has_many :likes
    has_secure_password
    validates :username, uniqueness: true    
end
