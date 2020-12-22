class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates_presence_of :name
    validates_uniqueness_of :name
    validates :age, numericality: {greater_than:0}
    validates :bio, length: {minimum:31}

    def total_likes
        self.posts.sum{|p|p.likes}
    end

    def best_post
        self.posts.max_by{|p|p.likes}
    end

    def five_most_written_about
        self.destinations.sort_by{|d| d.posts.length}.reverse[0..4]
    end
end