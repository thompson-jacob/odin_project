require_relative '../../ruby_projects/caesar_cypher.rb'

# Rspec.describe attaches to the class we want to test
# subject can be defined at the top, with a new instantiation of the class - the subject can then be used as a variable? that we can chain methods onto - for example 
#  subject { Caesar_Cypher.new } and then later on we could attach .cypher_message to the expect method expect(subject.cypher_message(message, shift)

#context is used to seperate different variations in the data - for example opposite ends of an if/else, or if we wanted to test different user roles

RSpec.describe Caesar_Cypher do
    describe '#cypher_message' do
      subject { Caesar_Cypher.new.cypher_message(message, shift) }

      
      context 'when at the end of alphabet' do
        let(:message) { 'zz' }
        let(:shift) { 2}

        it 'should shift each char to the right, all letters wrapping the alphabet' do
          expect(subject).to eq("bb")
        end
      end

      context 'when not at the end of alphabet' do
        let(:message) { 'hello' }
        let(:shift) { 2 }

        it 'should shift each char to the right, without any letters wrapping' do
          expect(subject).to eq("jgnnq")
        end
      end

      context 'when the letters are mixed between wrapping and not wrapping' do
        let(:message) { 'zillow' }
        let(:shift) { 8 }

        it 'should shift each char to the right, with some letters wrapping and others not needing to wrap' do
          expect(subject).to eq("hqttwe")
        end
      end

   
    
      
    end 
  end