#!/bin/ruby

class GroupCounter

  CELL_USED = 'X'

  def initialize(matrix)
    @matrix = matrix
    @n = @matrix.size
    @gap_by_borders = @n - 1
    @max_long = @n * @n
    @group_counter = [0,0]
  end
  
  def count_groups
    plain_matrix = parse_matrix

    (0..plain_matrix.size-1).each do |index|
      if is_not_part_of_a_group?(index, plain_matrix)
        plain_matrix, key  = grouping_neighbors(plain_matrix, index)
        add_group_to_counters(key)
      end
    end

    @group_counter
  end

  def parse_matrix
    plain_matrix = ""
    @matrix.each do |row|
      plain_matrix += row.join
      plain_matrix += CELL_USED
    end
    plain_matrix[0...-1]
  end

  private

    def grouping_neighbors(plain_matrix, index)

      key = plain_matrix[index]

      if key != CELL_USED
        plain_matrix[index] = CELL_USED

        inspect_right_neighbor(index, key, plain_matrix)
        inspect_left_neighbor(index, key, plain_matrix)
        inspect_bottom_neighbor(index, key, plain_matrix)
        inspect_top_neighbor(index, key, plain_matrix)

      end

      return plain_matrix,key
    end

    def inspect_top_neighbor(index, key, plain_matrix)
      index_top_neighbor = index - @n - 1
      if plain_matrix[index_top_neighbor] == key and index_top_neighbor >= 0
        grouping_neighbors(plain_matrix, index_top_neighbor)
      end
    end

    def inspect_bottom_neighbor(index, key, plain_matrix)
      index_bottom_neighbor = index + @n + 1
      if plain_matrix[index_bottom_neighbor] == key and index_bottom_neighbor <= @max_long + @gap_by_borders
        grouping_neighbors(plain_matrix, index_bottom_neighbor)
      end
    end

    def inspect_left_neighbor(index, key, plain_matrix)
      index_left_neighbor = index - 1
      if plain_matrix[index_left_neighbor] == key and index_left_neighbor >= 0
        grouping_neighbors(plain_matrix, index_left_neighbor)
      end
    end

    def inspect_right_neighbor(index, key, plain_matrix)
      index_right_neighbor = index + 1
      if plain_matrix[index_right_neighbor] == key and index_right_neighbor <= @max_long + @gap_by_borders
        grouping_neighbors(plain_matrix, index_right_neighbor)
      end
    end

    def is_not_part_of_a_group?(index, plain_matrix)
      plain_matrix[index] != CELL_USED
    end

    def add_group_to_counters(key)
      key == "1" ? @group_counter[0] += 1 : @group_counter[1] += 1
    end

end










