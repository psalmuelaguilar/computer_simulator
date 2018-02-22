require 'rails_helper'

RSpec.describe CodesController, type: :controller do
  describe 'GET #index' do
    it 'should run the index properly' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'POST #process_code' do
    let(:service) { CodeServices::Process }
    let(:pattern) do
      {
        data: true
      }
    end

    before do
      # service.stubs(:new).returns(stub(run: true))
      service.expects(:new).returns(stub(run: true))
    end

    it 'should return a output json' do
      post :process_code, params: { code: 'true' }
      expect(response).to be_success
      expect(response.body).to match_json_expression(pattern)
    end
  end

  describe 'GET Reset' do
    let(:service) { CodeServices::Restart }
    let(:pattern) do
      {
        data: String
      }
    end

    before do
      # service.stubs(:new).returns(stub(run: true))
      service.expects(:new).returns(stub(:run))
    end

    it 'should do the reset action' do
      get :reset
      expect(response).to be_success
    end
  end
end
