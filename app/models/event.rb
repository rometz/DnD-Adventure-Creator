class Event < ApplicationRecord
    belongs_to :quest

    # future relationships:
        # npcs
        # monsters
        # 'type-of-events':
            # combat
            # social
            # search

    validates :name, presence: true
    validates :description, presence: true

    # search method ActiveRecord
        # sort by event 'nodes'
        # how many booleans are true?
    
    def find_quest(event) 
        @event = Quest.find_by(id: event.id)
    end
end
