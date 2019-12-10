#!/usr/bin/env ruby

class NumberWords
  def initialize(number_string)
    @number_string = number_string
    @number_array = @number_string.split('').reverse().keep_if { |c| c =~ /[0-9]/ }
    @numbers = {
      '9' => ' nine',
      '8' => ' eight',
      '7' => ' seven',
      '6' => ' six',
      '5' => ' five',
      '4' => ' four',
      '3' => ' three',
      '2' => ' two',
      '1' => ' one',
      '0' => ''
    }
    @groups = {
      11 => ' hundred',
      8 => ' hundred',
      5 => ' hundred',
      2 => ' hundred',
      3 => ' thousand',
      6 => ' million',
      9 => ' billion',
      12 => ' trillion'
    }
    @tens = {
      '9' => ' ninety',
      '8' => ' eighty',
      '7' => ' seventy',
      '6' => ' sixty',
      '5' => ' fifty',
      '4' => ' fourty',
      '3' => ' thirty',
      '2' => ' twenty',
      '0' => ''
    }
    @teens = {
      '9' => ' ninteen',
      '8' => ' eighteen',
      '7' => ' seventeen',
      '6' => ' sixteen',
      '5' => ' fifteen',
      '4' => ' fourteen',
      '3' => ' thirteen',
      '2' => ' twelve',
      '1' => ' eleven',
      '0' => ' ten'
    }
    @words = ''
  end

  def get_words
    if @number_string == '0'
      return 'zero'
    end
    if @number_array.length == 0
      @words[0] = (@words[0] == ' ') ? '' : @words[0]
      return @words
    end
    current_index = @number_array.length - 1
    if [10,7,4,1].include?(current_index)
      this_digit = @number_array.pop
      if this_digit == '1'
        next_digit = @number_array.pop
        @words += @teens[next_digit]
        @words += (@groups[current_index - 1]) ? @groups[current_index - 1] : ''
      else
        @words += @tens[this_digit]
      end
    else
      this_digit = @number_array.pop
      @words += @numbers[this_digit]
      @words += (@groups[current_index] && this_digit != '0') ? @groups[current_index] : ''
    end
    self.get_words()
  end

end
