class EventSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :quest_id
    belongs_to :quest, :user
    # has_many :npcs, through: :event_objects
    # has_many :monsters, through: :event_objects
end