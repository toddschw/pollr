class AddTeamToPoll < ActiveRecord::Migration
  def change
    add_reference :polls, :team, index: true, foreign_key: true
  end
end
