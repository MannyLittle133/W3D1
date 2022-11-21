# My Each
# Extend the Array class to include a method named my_each that 
# takes a block, calls the block on every element of the array, 
# and returns the original array. Do not use Enumerable's each 
# method. I want to be able to write:

# calls my_each twice on the array, printing all the numbers 
# twice.

class Array
    def my_each()
        new_arr = []
        i = 0
        while i < self.length
            new_arr << self[i]
            i += 1
        end
        new_arr
    end

    def my_select(&blk)
        
        self.my_each.select do |ele|
            blk.call(ele)
        end

    end

end

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []


# return_value = [1, 2, 3].my_each do |num|
#     puts num
# end.my_each do |num|
#     puts num
# end
#     # => 1
#         2
#         3
#         1
#         2
#         3

# p return_value  # => [1, 2, 3]




