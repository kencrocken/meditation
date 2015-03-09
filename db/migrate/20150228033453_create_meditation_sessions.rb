class CreateMeditationSessions < ActiveRecord::Migration
  def change
    create_table :meditation_sessions do |t|
      t.integer :time_spent
      t.text :comment

      t.timestamps
    end
  end
end
