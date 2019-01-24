# frozen_string_literal: true

require 'spec_helper'

describe FooderWorker, type: :worker do
  describe 'Fooder' do
    let(:worker) { Food}
    let!(:worker) { FooderWorker.perform_async(actor: 1, object: [{key: 'Key', value: 'Value'}], timestamp: Time.now) }

    before do
      FooderWorker.drain
    end

    it 'should create fooder' do
      expect(Fooder.count).to eq 1
    end
  end
end
