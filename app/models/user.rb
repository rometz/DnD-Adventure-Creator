class User < ApplicationRecord
    has_secure_password

    has_many :quests
    # future relationships:
        # has_many :events, through: :quests

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
