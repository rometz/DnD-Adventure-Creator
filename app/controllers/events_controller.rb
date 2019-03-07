class EventsController < ApplicationController
    before_action :logged_in?

    def index
        if params[:quest_id] == nil
            @events = Event.all
            render 'index'
        else
            @events = Event.where(quest_id: params[:quest_id])
            @quest = Quest.find_by(id: params[:quest_id])
        end
    end

    def show
       # byebug
        @event = Event.find_by(id: params[:id])
        @quest = Quest.find_by(id: params[:quest_id])
    end

    def new
        @event = Event.new
        @quest = Quest.find_by(id: params[:quest_id])
    end

    def create

        @event = Event.new(events_params)
        @quest = Quest.find_by(id: params[:quest_id])
        @event.quest_id = @quest.id

        if @event.save
            redirect_to quest_event_path(@quest, @event)
        else
            render 'new'
        end
    end

    def edit
        @event = Event.find_by(id: params[:id])
        redirect_to events_path(@quest, :quest_id => params[:event][:quest_id])
    end

    def update
        @event = Event.find_by(id: params[:id])
        @event.update(event_params)
        redirect_to events_path(@quest, :quest_id => params[:event][:quest_id])
    end

    def destroy
        @event = Event.find_by(id: params[:id])
        quest_id = @event.quest_id
        @event.destroy
        redirect_to events_path(:quest_id => quest_id)
    end

    private

    def events_params
        params.require(:event).permit(:name, :description, :combat, :social, :search, :quest_id)
    end
end
