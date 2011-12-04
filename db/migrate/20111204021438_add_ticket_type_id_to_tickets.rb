class AddTicketTypeIdToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :ticket_type_id, :integer
  end
end
