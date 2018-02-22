require 'rails_helper'

RSpec.describe CodeServices::Restart, type: :service do
  let!(:service) { CodeServices::Restart.new }

  describe '#run' do
    it 'should clear rails cache' do
      Rails.cache.expects(:clear)
      service.run
    end
  end
end
