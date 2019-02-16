class Event < ApplicationRecord
    belongs_to :quest

    # future relationships:
        # npcs
        # monsters

    validates :name, presence: true
    validates :description, presence: true

    # search method ActiveRecord
        # sort by event 'nodes'
end
