class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def edit
    end

    def update
    end

    def create
        @post = Post.create(post_params)
        if @post.valid?
            redirect_to @post
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def add_likes
        @post = Post.find(params[:id])
        @post.update(likes: @post.likes + 1)
        redirect_to @post
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end