class PostsController < ApplicationController 
    def index
      @posts = Post.all
    end 

    def new
      @post = Post.new
    end
    def show
      @post = Post.find(params[:id])
    end

    def search 
      @posts = Post.where("posts.description LIKE ?",["%#{params[:query]}%"])
      render "index"
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy 
      redirect_to posts_path, notice: "Post deleted!"
    end

    private
    def post_params
      params.require(:post).permit(:title, :description)
    end

    def post_update_params
      params.require(:post).permit(:title, :description, :status)
    end
end
  
  
  
  