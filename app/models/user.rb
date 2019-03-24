class User < ApplicationRecord
    has_secure_password

    has_many :quests
    # future relationships:
    # has_many :adventures
    has_many :events, through: :quests

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    # #render_events
    # has_many events
    def user_events_call
        if logged_in?
            @user = User.find_by(id: params[:id])

            @quests = []
            @quest_id = @quests[0].id
            Quest.where(user_id: @user.id).find_each do |quest|
                @quests << quest
            end
            if @quests == nil
                @quest = 0
            else
                @quest = @quests[0]
            end

            @events = []
            Event.where(quest_id: @quest_id).find_each do |e|
                @events << e
            end
        end
    end
end
