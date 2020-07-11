class User < ActiveRecord::Base
    has_secure_password
    has_many :anime_list
    validates :email, :username, :password_digest, presence: true
end