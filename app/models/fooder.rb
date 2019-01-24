class Fooder
  include Mongoid::Document
  field :actor, type: String
  field :object, type: Array
  field :timestamp, type: DateTime

  validates :actor, presence: true
  validates :object, presence: true
  validates :timestamp, presence: true
  validate :validate_object_events

  searchkick

  # Validate object events
  def validate_object_events
    self.object = [] unless object.is_a? Array
    object.each_with_index do |event, index|
      validate_event_errors(event[:key], event[:value], index)
    end
  end

  # Validate a specific event
  def validate_event_errors(key, value, index)
    key_err_event(key, index) if key.blank?

    value_err_event(index) if value.blank?
  end

  # Add error for key
  def key_err_event(key, index)
    errors.add(:object, "Events: Invalid key #{key} for index #{index}")
  end

  # Add error for value
  def value_err_event(index)
    errors.add(:object, "Events: Invalid value for index #{index}")
  end
end
