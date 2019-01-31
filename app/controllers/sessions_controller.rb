class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        # create a session with or without OAuth
        auth_hash = request.env['omniauth.auth']
        if auth_hash
            @user = User.find_or_create_by(uid: auth_hash['uid']) do |u|
                u.name= auth_hash['info']['name']
                u.email= auth_hash['info']['email']
                u.password= SecureRandom.hex
            end
            login
        else
            @user = User.find_by(name: params[:user][:name])
            if @user && @user.authenticate(params[:user][:password])
                login
            else
                flash[:alert] = "Please make sure you have input the correct credentials"
                redirect_to signin_path
            end
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private

    def login
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
end
