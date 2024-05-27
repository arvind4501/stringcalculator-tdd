require 'byebug'

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      delimiter_end_index = numbers.index("\n")
      delimiter = numbers[2..delimiter_end_index - 1]
      numbers = numbers[(delimiter_end_index + 1)..-1]
    end

    numbers = numbers.gsub("\n", delimiter)
    number_list = numbers.split(/[#{delimiter}\n]/)
    negative_numbers = number_list.select { |n| n.to_i < 0 }

    if negative_numbers.any?
      raise "negative numbers not allowed: #{negative_numbers.join(', ')}"
    end

    number_list.map(&:to_i).sum
  end
end