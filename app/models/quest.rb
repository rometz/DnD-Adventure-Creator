class Quest < ApplicationRecord
    # future relationships:
    # belongs_to :adventure
    has_many :events
        # has_many :npcs
    belongs_to :user
   # accepts_nested_attributes_for :event, allow_destroy: true

    validates :name, presence: true
    validates :description, presence: true
end
