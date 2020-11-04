require './group_counter.rb'

describe "GroupCounter" do

  context 'count groups' do
    it 'count 2x2 matrix' do
      group_counter = GroupCounter.new([[1,1],[1,1]])
      total_groups = group_counter.count_groups
      expect(total_groups).to eq [1,0]
    end
    it 'count 2x2 matrix 2,2 groups' do
      group_counter = GroupCounter.new([[1,0],[0,1]])
      total_groups = group_counter.count_groups
      expect(total_groups).to eq [2,2]
    end

    it 'count 2x2 matrix 1,1 groups' do
      group_counter = GroupCounter.new([[1,1],[0,1]])
      total_groups = group_counter.count_groups
      expect(total_groups).to eq [1,1]
    end

    it 'count 3x3 matrix 0,1 groups' do
      group_counter = GroupCounter.new([[0,0,0],[0,0,0],[0,0,0]])
      total_groups = group_counter.count_groups
      expect(total_groups).to eq [0,1]
    end

    it 'count 4x4 matrix 0,1 groups' do
      group_counter = GroupCounter.new([[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]])
      total_groups = group_counter.count_groups
      expect(total_groups).to eq [0,1]
    end

    it 'count 6x6 matrix 0,1 groups' do
      group_counter = GroupCounter.new([[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]])
      total_groups = group_counter.count_groups
      expect(total_groups).to eq [0,1]
    end

    it 'base example 5,4' do
      group_counter = GroupCounter.new([
                                         [1, 0, 1, 1],
                                         [0, 1, 0, 0],
                                         [1, 0, 1, 1],
                                         [1, 0, 0, 0]
                                       ])
      total_groups = group_counter.count_groups
      expect(total_groups).to eq [5,4]
    end

    it 'base example 3,3' do
      group_counter = GroupCounter.new([
                                         [0, 0, 1, 1],
                                         [0, 0, 1, 0],
                                         [1, 0, 0, 1],
                                         [1, 1, 1, 0]
                                       ])
      total_groups = group_counter.count_groups
      expect(total_groups).to eq [3,3]
    end

    it 'base example 3,1' do
      group_counter = GroupCounter.new([
                                         [1, 0, 0, 0],
                                         [0, 1, 0, 0],
                                         [0, 0, 0, 0],
                                         [1, 1, 1, 1]
                                       ])
      total_groups = group_counter.count_groups
      expect(total_groups).to eq [3,1]
    end
  end

  context 'matrix parser' do
    it 'parse 2x2 matrix' do
      group_counter = GroupCounter.new([[1,0],[0,1]])
      plain_matrix = group_counter.parse_matrix
      expect(plain_matrix).to eq "10X01"
    end

    it 'parse 4x4 matrix' do
      group_counter = GroupCounter.new([
                                         [1, 0, 1, 1],
                                         [0, 1, 0, 0],
                                         [1, 0, 1, 1],
                                         [1, 0, 0, 0]
                                       ])
      plain_matrix = group_counter.parse_matrix
      expect(plain_matrix).to eq "1011X0100X1011X1000"
    end
  end
end

