class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :only_one
    def index
        users = User.all
        render json: users, include: :items
    end

    def show
        user = User.find(params[:id])
         render json: user, include: :items
        
    end

    private
        def only_one
            render json: { error: "not found" }, status: :not_found
        end
end
