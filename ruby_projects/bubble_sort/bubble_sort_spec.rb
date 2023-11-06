require_relative "./bubble_sort.rb"

RSpec.describe BubbleSort do 
  describe "#bubble_sort" do
    subject { BubbleSort.new }

    context "when the array is already sorted" do

      it "should return the array unchanged" do
        expect(subject.bubble_sort([1,4,6,7,14])).to eq([1,4,6,7,14])
      end
    end

    context "when the array is unsorted" do 

      it "should handle negative numbers" do
        expect(subject.bubble_sort([-1,-4,-6,-7,-14])).to eq([-14,-7,-6,-4,-1])
      end

      it "should handle duplicate numbers" do
        expect(subject.bubble_sort([5,5,3,10,1,3])).to eq([1,3,3,5,5,10])
      end
    end
  end
end