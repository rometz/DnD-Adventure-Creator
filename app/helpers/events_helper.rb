module EventsHelper
    def find_quest(event) 
        #byebug
        @quest = Quest.find_by(id: event.quest_id)
    end
end
