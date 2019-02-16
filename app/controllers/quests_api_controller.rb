class QuestsApiController < ApplicationController

    def index
    end

    def show
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