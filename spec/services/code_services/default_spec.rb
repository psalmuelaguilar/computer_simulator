require 'rails_helper'

RSpec.describe CodeServices::Default, type: :service do
  let!(:service) { CodeServices::Default.new }

  describe '#multiply' do
    it 'should multiply the parameters' do
      expect(service.multiply(2, 2)).to eq(4)
    end
  end

  describe '#print' do
    it 'should return the string character as string' do
      expect(service.print(2)).to eq('2')
    end
  end
end
