# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.

function _first_number(model::MyPuzzleRecordModel)::Int64
    for i ∈ 1:model.len
        value = Int(model.characters[i]);

        if(value >= 48 && value <= 57);
            return parse(Int64, model.characters[i]) * 10; # multiply first number by ten to convert to tens digit
        end
    end
end

function _second_number(model::MyPuzzleRecordModel)::Int64
    for i ∈ model.len:-1:1
        value = Int(model.characters[i]);

        if(value >= 48 && value <= 57);
            return parse(Int64, model.characters[i]); # second number is the ones digit
        end
    end
end

function _sum_with_words(model::MyPuzzleRecordModel)::Int64
    subs = Dict("one" => 1, "two" => 2, "three" => 3, "four" => 4, "five" => 5, "six" => 6, "seven" => 7, "eight" => 8, "nine" => 9)
    words = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    value = 0
    numbers = []

    for i ∈ 1:model.len
        try
            number = parse(Int, model.characters[i])
            append!(numbers, number)
        catch
            for j ∈ 1:9
                if startswith(model.record[i:end], words[j])
                    append!(numbers, subs[words[j]])
                end
            end
        end
    end
    value += numbers[1]*10 + numbers[end]
    return value
end

# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

TODO: Add documentation
"""

function decode_part_1(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
    
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();
    
    # TODO: Add the logic for part 1 here
    for (key, value) ∈ models
        first = _first_number(value)
        second = _second_number(value)
        total += first + second
        codes[key] = first + second
    end
    
    # return the total -
    return (total, codes);
end

"""
    decode_part_2(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

TODO: Add documentation
"""
function decode_part_2(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
     
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();
     
    # TODO: Add the logic for part 2 here
    for (key, value) ∈ models
        total += _sum_with_words(value)
        codes[key] = _sum_with_words(value)
    end

     # return the total -
     return (total, codes);
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #