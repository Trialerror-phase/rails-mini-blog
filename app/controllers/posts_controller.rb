class PostsController < ApplicationController
    def index #shows all posts 
        @posts = Post.all

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
