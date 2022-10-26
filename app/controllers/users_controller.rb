class UsersController < ApplicationController
    def show
        #byebug
        @user = User.find(params[:id])
    end

end