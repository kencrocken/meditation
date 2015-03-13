class AddCommentToMeditationSession < ActiveRecord::Migration
  def change
    add_column :meditation_sessions, :comment, :string
  end
end
