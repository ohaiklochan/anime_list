class User < ActiveRecord::Base
    has_secure_password
    has_many :animelist
    validates :email, :username, :password, presence: true
end