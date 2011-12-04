class Ticket < ActiveRecord::Base
  validates_presence_of :title, :ticket_type

  belongs_to :ticket_type
end
