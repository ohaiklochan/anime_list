class User < ActiveRecord::Base
    has_secure_password
    has_many :animelist
    has_many :anime, through: :animelist
end