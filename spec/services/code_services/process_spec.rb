require 'rails_helper'

RSpec.describe CodeServices::Process, type: :service do
  let!(:service) { CodeServices::Process.new('1 + 1') }

  describe '#run' do
    before do
      Rails.cache.expects(:fetch).at_least(2).returns(['1 + 1'])
    end
    it 'should eval the code that is being passed' do
      expect(service.run).to eq(2)
    end
  end
end
