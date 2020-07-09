class Anime < ActiveRecord::Base
    belongs_to :animelist
    belongs_to :user
end