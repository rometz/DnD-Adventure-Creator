class Event < ApplicationRecord
    belongs_to :quest
    belongs_to :user

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

end
