class QuestsApiController < ApplicationController

    def index
        quests = Quest.where(user_id: current_user.id)
        render json: quests
    end

    def show
        quest = Quest.find_by(id: params[:id])
        render json: quest
    end

    def new
        quest = Quest.new
    end

    def create
        quest = Quest.create
        render json: quest, status: 201
    end

    private

    def quests_params
        params.require(:quest).permit(:name, :description)
    end
end