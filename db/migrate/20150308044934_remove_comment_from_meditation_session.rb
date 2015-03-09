class RemoveCommentFromMeditationSession < ActiveRecord::Migration
  def change
    remove_column :meditation_sessions, :comment, :text
  end
end
