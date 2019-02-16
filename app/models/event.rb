class Event < ApplicationRecord
    belongs_to :quest

    # future relationships:
        # npcs
        # monsters

    validates :name, presence: true
    validates :description, presence: true
end
