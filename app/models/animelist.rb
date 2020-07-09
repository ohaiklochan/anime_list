class AnimeList < ActiveRecord::Base
    belongs_to :user
    validates :name, :type, :genre, presence: true
end