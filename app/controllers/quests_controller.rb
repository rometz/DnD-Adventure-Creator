class QuestsController < ApplicationController
    before_action :logged_in?

    def index
    end

    def show
        # for JS framework
        @id = params[:id]

        @quest = Quest.find_by(id: params[:id])
    end
    
    def new
        @quest = Quest.new
    end

    def create
        @quest = Quest.new(quests_params)
        @quest.user_id = current_user.id if current_user
        if @quest.save
            redirect_to quests_path(@quest)
        else
            render 'new'
        end
    end

    def edit
        #for JS framework
        @id = params[:id]

        @quest = Quest.find_by(id: params[:id])
    end

    def update
        @quest = Quest.find_by(id: params[:id])
        @quest.update(quests_params)
        redirect_to quests_path(@quest)
    end

    def destroy
        @quest = Quest.find_by(id: params[:id])
        @quest.destroy
        redirect_to quests_path(@quest)
    end

    private

    def quests_params
        params.require(:quest).permit(:name, :description)
    end
end
