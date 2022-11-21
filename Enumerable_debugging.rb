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
        new_arr = []
        self.my_each do |ele|
            if blk.call(ele) 
                new_arr << ele
            end
            new_arr
        end

    end


    def my_reject(&blk)
        self.reject { |ele| blk.call(ele)}
    end

    def my_any?(&blk)
        self.any? { |ele| blk.call(ele)}
    end

    def my_all?(&blk)
        self.all? { |ele| blk.call(ele)}
    end

    def my_flatten(&blk)
        self.flatten
    end

    def my_zip(*args) 
        new_arr = []
        
        self.length.times do |i|
            inner_arr = []
            args.my_each do |arg|
                arg.my_each do |ele|
                    inner_arr << ele[i]
                end
            end
            new_arr << inner_arr
        end

        new_arr
    end
end


# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]


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




