class PostsController < ApplicationController
    def new
        @info = Info.find(params[:info_id])
        @post = Post.new
    end

    def create
        @info = Info.find(params[:info_id])
        @post = Post.new(post_params)
        @post.info = @info
        @post.user = current_user

        if @post.save
            redirect_to info_path(@info)
        else
            render :new
        end
    end

    private

    def post_params
        params.require(:post).permit(:content, :user_id, :info_id)
    end
end
