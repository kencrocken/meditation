class AddUserToMeditationSession < ActiveRecord::Migration
  def change
    add_reference :meditation_sessions, :user, index: true
  end
end
