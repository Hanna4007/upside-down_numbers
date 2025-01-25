def upside_down(x,y)
  valid_numbers = ["0", "1", "6", "8", "9"]
  valid_reverse_numbers = ["0", "1", "8"]
  arr_upside_down = []
  (x.length..y.length).each do |length_of_number|
    generate_arr_upside_down(length_of_number, valid_numbers, valid_reverse_numbers, x, y, arr_upside_down)
  end
  arr_upside_down.count
end

def generate_arr_upside_down(length_of_number, valid_numbers, valid_reverse_numbers, x, y, arr_upside_down)
  half_length_of_number = length_of_number/2
  valid_numbers.repeated_permutation(half_length_of_number).each do |number|
    first_part = number.join("")
    next if first_part[0] == "0"
    second_part = first_part.tr("69", "96").reverse

    if length_of_number.odd?
      valid_reverse_numbers.each do |middle|
        add_num_if_valid(first_part + middle + second_part, x, y, arr_upside_down)
      end
    else
      add_num_if_valid(first_part + second_part, x, y, arr_upside_down)      
    end    
  end
end


def add_num_if_valid(num, x, y, arr_upside_down)
  number = num.to_i
  arr_upside_down << number if number.between?(x.to_i, y.to_i)  
end

