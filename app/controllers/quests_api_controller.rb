class QuestsApiController < ApplicationController

    def index
        quests = Quest.where(user_id: current_user.id)
        render json: quests
    end

    def show
        quest = Quest.find_by(id: params[:id])
        render json: quest.to_json(:methods => <<input method not yet created>> )
    end

    def new
    end

    def create
    end

    private

    def quests_params
        params.require(:quest).permit(:name, :description)
    end
end