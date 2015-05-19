require 'pry'
require 'minitest/autorun'

class Statistician
	def initialize given_name=nil
		@stored_name = given_name
		@computes = 0
	end

	def name
		@stored_name
	end

	def mean numbers
		@computes += 1
		sum(numbers).to_f / numbers.count
	end

	def median numbers
		middle = numbers.count / 2
		#numbers.sort[middle]
		sorted_numbers = numbers.sort
		sorted_numbers[middle]
	end

	def mode numbers
		winner = numbers.first
		winning_score = 0
		numbers.each do |n|
			score = numbers.count(n)
			if score > winning_score
				winner = n
				winning_score = score
			end
		end
		winner
	end

	def sum numbers
		sum_of_numbers = 0
		numbers.each do |n|
			sum_of_numbers += n
		end
		sum_of_numbers
	end

	def computations_performed
		@computes
	end

	def sleep
		@computes = 0
	end


end

class StatisticianTest < MiniTest::Test
	def test_names
		s = Statistician.new "Alice"
		t = Statistician.new "Bob"
		assert_equal "Alice", s.name
		assert_equal "Bob", t.name
	end

	def test_history_tracking
		s = Statistician.new
		assert_equal 0, s.computations_performed
		13.times do
			s.mean [2,4]
		end
		assert_equal 13, s.computations_performed

		s.sleep
		assert_equal 0, s.computations_performed
	end

	def test_mean_of_three_numbers
		s = Statistician.new
		assert_equal s.mean([5,10,15]), 10
	end

	def test_mean_of_two_numbers
		s = Statistician.new
		assert_equal s.mean([5,10]), 7.5
	end

	def test_median_sorted
		s = Statistician.new
		assert_equal s.median([1,2,3,4,5]), 3
	end

	def test_mode
		s = Statistician.new
		assert_equal s.mode([1,2,5,7,9,1,1]), 1
	end

	def test_sum_of_numbers
		s = Statistician.new
		assert_equal s.sum([5,10,15]), 30
	end
end

# numbers = [1,2,3,5,7,9,1,1]

# s = Statistician.new

# puts "Mean: #{s.mean numbers}"
# puts "Median: #{s.median numbers}"
# puts "Mode: #{s.mode numbers}"
