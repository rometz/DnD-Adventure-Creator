class Quest < ApplicationRecord
    # future relationships:
    # belongs_to :adventure
    has_many :events
        # has_many :npcs
    belongs_to :user

    validates :name, presence: true
    validates :description, presence: true
end
