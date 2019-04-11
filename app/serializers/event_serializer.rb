class EventSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :quest_id, :combat, :social, :search
    belongs_to :quest
    # has_many :npcs, through: :event_objects
    # has_many :monsters, through: :event_objects
end