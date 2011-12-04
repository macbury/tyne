class AddDueDateToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :due_date, :date
  end
end
