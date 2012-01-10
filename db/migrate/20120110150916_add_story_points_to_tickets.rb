class AddStoryPointsToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :story_points, :integer
  end
end
