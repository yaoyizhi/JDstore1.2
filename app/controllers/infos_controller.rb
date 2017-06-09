class InfosController < ApplicationController
    def index
        @infos = Info.all
    end

    def show
        @info = Info.find(params[:id])
        @posts = @info.posts
    end
end
