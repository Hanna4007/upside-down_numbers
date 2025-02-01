VALID_NUMBERS = ["0", "1", "6", "8", "9"]
VALID_REVERSE_NUMBERS  = ["0", "1", "8"]

VALID_NUMBERS_1 = ["9", "8", "6", "1", "0"]
VALID_REVERSE_NUMBERS_1  = ["8", "1", "0"]

def upside_down(x,y)
  full_amount_of_upside_down_numbers(x, y) - unnecessary_x(x) - unnecessary_y(y)  
end  

def unnecessary_x(x)
  arr_unnecessary_x = []  
  generate_arr_unnecessary_x(x.length, x.to_i, arr_unnecessary_x)
  arr_unnecessary_x.count
end

def unnecessary_y(y)
  arr_unnecessary_y = []  
  generate_arr_unnecessary_y(y.length, y.to_i, arr_unnecessary_y)
  arr_unnecessary_y.count
end

def generate_arr_unnecessary_x(length_of_number, x, arr_unnecessary_x)
  half_length_of_number = length_of_number/2
  VALID_NUMBERS.repeated_permutation(half_length_of_number).each do |number|
    first_part = number.join("")
    next if first_part[0] == "0"
    second_part = first_part.tr("69", "96").reverse

    if length_of_number.odd?
      VALID_REVERSE_NUMBERS.each do |middle|
        return unless add_to_unnecessary_x_if_valid(first_part + middle + second_part, x, arr_unnecessary_x)
      end
    else
      return unless add_to_unnecessary_x_if_valid(first_part + second_part, x, arr_unnecessary_x)
    end       
  end
end

def add_to_unnecessary_x_if_valid(generated_number, x, arr_unnecessary_x)
  number = generated_number.to_i
  if number >= x
    nil
  else
    arr_unnecessary_x << number
    number
  end
end

def generate_arr_unnecessary_y(length_of_number, y, arr_unnecessary_y)
  half_length_of_number = length_of_number/2
  VALID_NUMBERS_1.repeated_permutation(half_length_of_number).each do |number|
    first_part = number.join("")
    next if first_part[0] == "0"
    second_part = first_part.tr("69", "96").reverse

    if length_of_number.odd?
      VALID_REVERSE_NUMBERS_1.each do |middle|
        return unless add_to_unnecessary_y_if_valid(first_part + middle + second_part, y, arr_unnecessary_y)
      end
    else
      return unless add_to_unnecessary_y_if_valid(first_part + second_part, y, arr_unnecessary_y)
    end       
  end
end

def add_to_unnecessary_y_if_valid(generated_number, y, arr_unnecessary_y)
  number = generated_number.to_i
  if number <= y
    nil
  else
    arr_unnecessary_y << number
    number
  end
  
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