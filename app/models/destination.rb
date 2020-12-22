class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def five_most_recent
        self.posts.sort_by{|p|p.created_at}[0..4]
    end

    def featured
        self.posts.max_by{|p|p.likes}
    end

    def average_blogger_age
        self.bloggers.uniq.sum{|b|b.age} / self.bloggers.length
    end
end
