class Admin::InfosController < ApplicationController
    before_action :authenticate_user!
    before_action :require_is_admin
    layout 'admin'
    def index
        @infos = Info.all
    end

    def show
        @info = Info.find(params[:id])
    end

    def new
        @info = Info.new
    end

    def create
        @info = Info.new(info_params)
        if @info.save
            redirect_to admin_infos_path
        else
            render :new
        end
    end

    private

    def info_params
        params.require(:info).permit(:title, :description)
    end
end
