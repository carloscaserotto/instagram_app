class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_post, only: [:show]


    def index
        @posts = Post.all.limit(10).includes(:photos)
        #@posts= Post.all
        @post = Post.new
    end

    def create
        #byebug
        @post = current_user.posts.build(post_parmas)
        if @post.save
            if params[:images]
                params[:images].each do |img|
                    @post.photos.create(image: img)
                end
            end
            redirect_to posts_path
            flash[:notice]="Save..."
        else
            flash[:alert] = "Something went wrong ..."
            redirect_to posts_path
        end
    end

    def show
        @photos = @post.photos
    end

    private
    def find_post
        @post = Post.find_by id: params[:id]

        return if @post
        flash[:danger] = "Post not exist"
        redirect_to root_path
    end

    def post_parmas
        params.require(:post).permit :content
    end

end
