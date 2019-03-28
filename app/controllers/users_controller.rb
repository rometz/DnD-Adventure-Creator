class UsersController < ApplicationController
    before_action :logged_in?

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.save
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        if logged_in?
            @user = User.find_by(id: params[:id])
            @quests = []
            Quest.where(user_id: @user.id).find_each do |quest|
                @quests << quest
            end
            
            if @quests == nil
                @quest = 0
            else
                @quest = @quests[0]
            end
        else
            redirect_to root_url
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
