# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.

function _first_number(model::MyPuzzleRecordModel)
    for i ∈ 1:model.len
        value = Int(model.characters[i]);

        if(value >= 48 && value <= 57);
            return parse(Int64, model.characters[i]) * 10; # multiply first number by ten to convert to tens digit
        end
    end
end

function _second_number(model::MyPuzzleRecordModel)
    for i ∈ model.len:-1:1
        value = Int(model.characters[i]);

        if(value >= 48 && value <= 57);
            return parse(Int64, model.characters[i]); # second number is the ones digit
        end
    end
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
  
     # return the total -
     return (total, codes);
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #