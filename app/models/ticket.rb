class Ticket < ActiveRecord::Base
  validates_presence_of :title, :ticket_type_id, :project_id

  belongs_to :ticket_type
  belongs_to :project

  has_many :comments

  state_machine :state, :initial => :open do
    event :start_working do
      transition [:open, :review, :pending, :test] => :work
    end

    event :work_completed do
      transition :work => :review
    end

    event :review_failed do
      transition :review => :work
    end

    event :review_successfull do
      transition :review => :test
    end

    event :task_is_done do
      transition :test => :done
    end

    event :task_is_invalid do
      transition :open => :invalid
    end

    state all - [:done, :invalid] do
      def completed?
        false
      end
    end

    state :done, :invalid do
      def completed?
        true
      end
    end
  end

  def available_transitions
    current = { self.state => nil }
    self.state_transitions.each do |x|
      current[x.to] = x.event
    end unless self.new_record?

    current
  end

  scope :not_completed, :conditions => { :state => ["open", "work", "review", "test"] }
end
