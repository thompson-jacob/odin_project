
require_relative '../../ruby_projects/substrings.rb'

RSpec.describe SubStrings do 
  describe '#check_substrings' do
    subject { SubStrings.new.check_substrings(string, dict) }

    

    context 'when each substring only occurs once' do
      let(:string) {'arthouse'}
      let(:dict)  {['art', 'house','thou','use', 'arthouse']}

      it 'should count each substring once' do
        expect(subject).to eq({"art" => 1, "house" => 1, "thou" => 1, "use" => 1, "arthouse" => 1})
      end
    end

    context 'when substrings occurs multiple times' do
      let(:string) {"how do we know who's who, and how are they?"}
      let(:dict)  {['how', 'who','know','and', 'are', 'they', 'we', 'do']}

      it 'should count each substring once' do
        expect(subject).to eq({"how" => 2, "who" => 2, "know" => 1, "and" => 1, "are" => 1, 'they' => 1, 'we' => 1, 'do' => 1})
      end
    end
    
    context 'when a substring occurs multiple times and overlaps within the same string' do
      let(:string) {"testest"}
      let(:dict)  {['test']}
      it 'counts each occurence, even when overlapping' do 
        expect(subject).to eq({'test' => 2})
      end
    end

    context 'when a substring occurs multiple times without overlap' do
    let(:string) {"testtest"}
    let(:dict)  {['test']}
      it 'counts each occurence within the same string' do 
        expect(subject).to eq({'test' => 2})
      end
    end
  end

end

# test when the string is a single word
# test when the string has multiple words
# test multiple occurences of substrings within the string


