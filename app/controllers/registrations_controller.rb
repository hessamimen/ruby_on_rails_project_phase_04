class RegistrationsController < ApplicationController
    layout 'admin'
    def new
        @adminUser = AdminUser.new
    end
    
    def create
        @adminUser = AdminUser.new(adminUser_params)

        if @adminUser.save
            session[:user_id] = @adminUser.id
            redirect_to admin_path, notice: "Successfully created Account"
        else
            render 'new'
        end

    end

    private

    def adminUser_params
        params.require(:admin_user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end 