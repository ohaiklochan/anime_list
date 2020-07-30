class User < ActiveRecord::Base
    has_secure_password
    has_many :anime_lists
    validates :email, :username, presence: true
    validates :email, :username, uniqueness: true
end