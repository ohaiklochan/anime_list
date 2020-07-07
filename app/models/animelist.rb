class AnimeList < ActiveRecord::Base
    belongs_to :user
    has_many :anime
end