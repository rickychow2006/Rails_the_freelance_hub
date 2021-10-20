class ServicesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index 
        @services = Service.paginate(page: params[:page], per_page:20)
    end 

    def show 
        redirect_if_not_logged_in
        @service = Service.find(params[:id])
    end 
end
