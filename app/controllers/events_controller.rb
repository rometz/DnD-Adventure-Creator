class EventsController < ApplicationController
    before_action :logged_in?

    def index
    end

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def events_params
        params.require(:events).permit(:name, :description, :combat, :social, :search, :quest_id)
    end
end
