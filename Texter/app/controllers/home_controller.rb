class HomeController < ApplicationController
    def index
        @posts = Post.all
        
        @subscriber = Subscriber.new
        @user = :user_id
        @user = User.last
        post = post.id
        
    end
    
private
    def subscriber_params
        params.require(:subscriber).permit(:phone, :post_id)
    end
    
    def subscriber_params
        params.require(:subscriber).permit(:phone, :post_id)
    end
    
    def subscriber_params
        params.require(:subscriber).permit(:phone, :post_id)
    end
end
