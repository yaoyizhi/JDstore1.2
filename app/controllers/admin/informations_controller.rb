class Admin::InformationsController < ApplicationController
    def index
        @informations = Information.all
    end

    def new
        @information = Information.new
    end

    def create
        @information = Information.new(information_params)
        if @information.save
            redirect_to admin_informations_path
        else
            render :new
        end
    end

    private

    def information_params
        params.require(information).permit(:title, :description)
    end
end
