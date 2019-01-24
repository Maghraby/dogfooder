# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FoodersController, type: :request do
  describe '#create_fooder' do
    let(:url) { "/fooders" }
    let(:params) { {actor: 1, object: [{key: 'key', value: 'value'}], timestamp: Time.now} }
    
    context 'when all params correct' do
      it 'should return 200' do
        post url, params: params
        expect(response.status).to eq 200
      end
    end

    context 'when it missing params' do
      let(:params) { super().except(:timestamp) }
      it 'should return 400' do
        post url, params: params
        expect(response.status).to eq 400
      end
    end
  end
end