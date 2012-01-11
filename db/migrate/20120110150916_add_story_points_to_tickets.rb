class AddStoryPointsToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :story_points, :decimal
  end
end
