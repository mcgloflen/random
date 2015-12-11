class PostsController < ApplicationController
    
    before_action :authenticate_user!
    
    def index
        @posts = current_user.posts
        
        @subscriber = Subscriber.new
        
    end
        
    def new
		@post = Post.new
		@user = User.find(params[:user_id])
	end

	def create
		post = User.find(params[:user_id]).posts.create(post_params)

		if post.valid?
			redirect_to user_posts_path(current_user.id)
		else
			flash[:error] = "Post could not be saved."
			redirect_to :back
		end
	end
	
	def edit
	    @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
        
    end
    
    def update
        @post = User.find(params[:user_id]).posts.find(params[:id])
        
        @post.update_attributes(post_params)
        
        redirect_to user_posts_path
    end
    
    def destroy
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
        
        @post.destroy
        
        redirect_to :back
    end
	
	def dashboard
	    @user = current_user
        
	end

private

	def post_params
		params.require(:post).permit(:title, :description, :text1, :text2)
	end

        
end
