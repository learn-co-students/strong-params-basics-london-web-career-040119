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

	def edit
	  @post = Post.find(params[:id])
	end

	def create
  @post = Post.new(params.require(:post).permit(:title, :description))  #strong params
  @post.save
  redirect_to post_path(@post)
  end

	#def update
	  #@post = Post.find(params[:id])
	  #@post.update(params["post"])
	  #redirect_to post_path(@post)
	#end

	def update
  @post = Post.find(params[:id])
  @post.update(params.require(:post).permit(:title))  #strong params, only title to be submitable
  redirect_to post_path(@post)
end

private

def post_params(*args)
 params.require(:post).permit(*args)
end

end
