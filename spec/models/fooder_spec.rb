# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fooder, type: :model do
  it { should validate_presence_of :actor }
  it { should validate_presence_of :object }
  it { should validate_presence_of :timestamp }


  let(:fooder) { create :fooder }

  describe '.validate_object' do
    context 'when params are correct' do
      it 'should validate successfully' do
        fooder.object = [{key: 'Click', value: 'Button'}]
        expect(fooder).to be_valid
      end
    end

    context 'when missing value' do
      it 'should not validate' do
        fooder.object = [{key: 'Click', value: 'Button'}, {key: 'click'}]
        expect(fooder).not_to be_valid
        expect(fooder.errors).to include(:object)
      end
    end
  end
end
