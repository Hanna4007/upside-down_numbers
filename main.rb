VALID_NUMBERS = ["0", "1", "6", "8", "9"]
VALID_REVERSE_NUMBERS  = ["0", "1", "8"]

def upside_down(x,y)  
  arr_upside_down = []
  (x.length..y.length).each do |length_of_number|
    generate_arr_upside_down(length_of_number, x.to_i, y.to_i, arr_upside_down)
  end
  arr_upside_down.count
end

def generate_arr_upside_down(length_of_number, x, y, arr_upside_down)
  half_length_of_number = length_of_number/2
  VALID_NUMBERS.repeated_permutation(half_length_of_number).each do |number|
    first_part = number.join("")
    next if first_part[0] == "0"
    second_part = first_part.tr("69", "96").reverse

    if length_of_number.odd?
      VALID_REVERSE_NUMBERS.each do |middle|        
        add_num_if_valid(first_part + middle + second_part, x, y, arr_upside_down)
      end
    else
      add_num_if_valid(first_part + second_part, x, y, arr_upside_down)      
    end    
  end
end


def add_num_if_valid(num, x, y, arr_upside_down)
  number = num.to_i
  arr_upside_down << number if number.between?(x, y)
end

def full_amount_of_upside_down_numbers(x, y)
  (x.length..y.length).sum do |length_of_number|
    calculation_amount_of_numbers(length_of_number)
  end
end

def calculation_amount_of_numbers(length_of_number)
  if length_of_number == 1
    return 3
  elsif length_of_number.odd?
    5 ** (((length_of_number - 4)/2).floor+ 1) * 4 * 3
  else
    5 ** (((length_of_number - 4)/2).floor + 1) * 4
  end
end
