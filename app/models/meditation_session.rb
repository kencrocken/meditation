class MeditationSession < ActiveRecord::Base
    belongs_to :user
    validates :time_spent, presence: true, numericality: { only_integer: true }
end
