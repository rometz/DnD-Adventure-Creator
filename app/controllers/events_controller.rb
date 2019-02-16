class EventsController < ApplicationController
    before_action :logged_in?

    def index
        @events = Event.where(quest_id: params[:quest_id])
        @quest = Quest.find_by(id: params[:quest_id])
    end

    def show
        @event = Event.find_by(id: params[:id])
        @quest = Quest.find_by(id: params[:budget_id])
    end

    def new
        @event = Event.new
        @quest = Quest.find_by(id: params[:quest_id])
    end

    def create
        @event = Event.new(event_params)
        @quest = Quest.find_by(id: params[:event][:quest_id])
        if @event.save
            redirect_ti events_path(@quest, :quest_id => params[:event][:quest_id])
        else
            render 'new'
        end
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
