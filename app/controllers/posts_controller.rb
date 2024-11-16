class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def index #shows all posts 
        @posts = Post.all

    end 

    def show
        # Logic for showing a single post
        @post = Post.find(params[:id])
        @comments = @post.comments # Fetch the comments related to this post
        @comment = Comment.new # Initialize a new comment object for the form
      end

    def new #creates new posts 
        @post = Post.new
    end 

    def create
        @post = Post.new(post_params)
        if @post.save
          redirect_to posts_path, notice: "Post created!"
        else
          render :new
        end
      end

    private  

    def 
        post_params
        params.require(:post).permit(:title, :content)

    end

end
