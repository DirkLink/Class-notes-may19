require 'pry'
require 'minitest/autorun'

class Statistician
	def mean numbers
		sum_of_numbers = 0
		numbers.each do |n|
			sum_of_numbers += n
		end
		sum_of_numbers.to_f / numbers.count
	end

	def median numbers
		middle = numbers.count / 2
		#numbers.sort[middle]
		sorted_numbers = numbers.sort
		sorted_numbers[middle]
	end


end

class StatisticianTest < MiniTest::Test
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
end

# numbers = [1,2,3,5,7,9,1,1]

# s = Statistician.new

# puts "Mean: #{s.mean numbers}"
# puts "Median: #{s.median numbers}"
# puts "Mode: #{s.mode numbers}"
