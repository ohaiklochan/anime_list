class AnimeList < ActiveRecord::Base
    belongs_to :user
    validates :name, :classification, :genre, presence: true
end