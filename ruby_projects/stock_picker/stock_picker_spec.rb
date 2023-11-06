require_relative './stock_picker.rb'


RSpec.describe StockPicker do
    describe '#stock_picker' do
      subject { StockPicker.new.stock_picker(stock_prices) }

      
      context 'when positive price is possible' do
        let(:stock_prices) { [17,3,6,9,15,8,6,1,10] }
        

        it 'should return the low and high index of greatest max profit' do
          expect(subject).to eq([1,4])
        end
      end

      context 'when only negative price is possible' do
        let(:stock_prices) { [17,15,14,9] }
        

        it 'should return [0,0] indicating no trades were made' do
          expect(subject).to eq([0,0])
        end
      end
      
    end 
  end