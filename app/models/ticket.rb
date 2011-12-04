class Ticket < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :ticket_type
end
