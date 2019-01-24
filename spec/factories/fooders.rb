# frozen_string_literal: true

FactoryGirl.define do
  factory :fooder do
    actor 1
    object [{key: 'Key', value: 'value'}]
    timestamp Time.now
  end
end