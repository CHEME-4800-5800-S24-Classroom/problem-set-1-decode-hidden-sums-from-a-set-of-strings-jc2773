# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.

"""
_first_digit(model::MyPuzzleRecordModel) -> Int64

This function computes the first digit of the encoded line of text and returns this digit as an Int64. It takes one argument,
a MyPuzzleRecordModel instance. It traverses each character in the encoded line of text from the beginning until a digit is found.
"""
function _first_digit(model::MyPuzzleRecordModel)::Int64
    for i ∈ 1:model.len
        value = Int(model.characters[i]);

        if(value >= 48 && value <= 57);
            return parse(Int64, model.characters[i]) * 10; # multiply first number by ten to convert to tens digit
        end
    end
end

"""
_last_digit(model::MyPuzzleRecordModel) -> Int64

This function computes the last digit of the encoded line of text and returns this digit as an Int64. It takes one argument,
a MyPuzzleRecordModel instance. It traverses each character in the encoded line of text from the end until a digit is found.
"""
function _last_digit(model::MyPuzzleRecordModel)::Int64
    for i ∈ model.len:-1:1
        value = Int(model.characters[i]);

        if(value >= 48 && value <= 57);
            return parse(Int64, model.characters[i]); # second number is the ones digit
        end
    end
end

"""
_sum_with_words(model::MyPuzzleRecordModel) -> Int64

This function computes the first and last digit of the encoded line of text and returns the resulting two-digit integer as an Int64.
It takes one argument, a MyPuzzleRecordModel instance. It traverses each character in the encoded line of text from the beginning.
If a digit is found, it is added to the numbers array. If a spelled number is found, it is converted to an integer and added to the
numbers array. The two-digit integer is computed by taking the first and last elements in the numbers array.
"""
function _sum_with_words(model::MyPuzzleRecordModel)::Int64
    numbers_dictionary = Dict("one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9)
    words = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    value = 0
    numbers = []

    for i ∈ 1:model.len
        try
            number = parse(Int, model.characters[i])
            append!(numbers, number)
        catch
            for j ∈ eachindex(words) # traverse array of spelled numbers
                if startswith(model.record[i:end], words[j])
                    append!(numbers, numbers_dictionary[words[j]]) # use array element as key for numbers_dictionary
                end
            end
        end
    end
    value += numbers[1]*10 + numbers[end] # compute two-digit integer
    return value
end

# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

This function takes a Dictionary as an argument, with the key as the line number in the file and the value as a
MyPuzzleRecordModel instance holding the encoded line of text. A Tuple with two elements is returned. The
two-digit integer from each encoded line of text is added to the total. The total is the first element of the Tuple.
The second element of the Tuple is a Dictionary of type Dict{Int64, Int64}, with the key as the line number of the
encoded text and the value as the two-digit integer computed from this line of text.
"""
function decode_part_1(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
    
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();
    
    for (key, value) ∈ models
        first = _first_digit(value)
        last = _last_digit(value)
        total += first + last # compute two-digit integer
        codes[key] = first + last
    end
    
    # return the total -
    return (total, codes);
end

"""
    decode_part_2(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

This function takes a Dictionary as an argument, with the key as the line number in the file and the value as a
MyPuzzleRecordModel instance holding the encoded line of text. A Tuple with two elements is returned. The
two-digit integer from each encoded line of text is added to the total. The total is the first element of the Tuple.
The second element of the Tuple is a Dictionary of type Dict{Int64, Int64}, with the key as the line number of the
encoded text and the value as the two-digit integer computed from this line of text.
"""
function decode_part_2(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
     
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();

    for (key, value) ∈ models
        total += _sum_with_words(value)
        codes[key] = _sum_with_words(value)
    end

     # return the total -
     return (total, codes);
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #