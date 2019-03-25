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
            @user = current_user.id
            @events = @user.events
        end
    end
end
