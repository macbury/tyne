class TicketType < ActiveRecord::Base
  validates_presence_of :name

  has_many :tickets
end
