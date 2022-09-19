# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"
class Array
    def span 
        return nil if self.empty?
         self.max - self.min 
    end

    def average 
        return nil if self.empty?
        self.sum / self.length.to_f
    end

    def median 
        return nil if self.empty?
        sorted = self.sort
        index = sorted.length/2
        if self.length.odd?
            sorted[index]
        else
            (sorted[index - 1] + sorted[index])/ 2.0
        end
    end

    def counts 
        hash = Hash.new(0)
        self.each {|ele| hash[ele] +=1}
        hash
    end

    def my_count(arg)
        hash = Hash.new(0)
        self.each {|ele| hash[ele] +=1}
        hash.each do |h, k|
           if h == arg  
            return k 
           end
       end
       return 0
    end

    def my_index(arg)
        self.each_with_index do |ele, i|
            return i if ele == arg
        end
        nil      
    end

    def my_uniq
        new_array = []
        self.each do |ele|
           new_array << ele if !new_array.include?(ele)
        end
        new_array
    end

    def my_transpose
        length = self.first.length
        (0...length).map do |i| # ele in sub
            self.map {|arr| arr[i]} #each sub
        end
    end
end
