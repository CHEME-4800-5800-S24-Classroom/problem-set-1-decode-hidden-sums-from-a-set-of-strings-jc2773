
# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    puzzleparse(filename::String) -> Dict{Int64, MyPuzzleRecordModel}

This function creates and returns a Dictionary, with the key as the line number in the file and the value as a
MyPuzzleRecordModel instance holding the encoded line of text. It takes one argument, a file name/file path string.
"""
function puzzleparse(filename::String)::Dict{Int64, MyPuzzleRecordModel}
    
    # initialize -
    records = Dict{Int64, MyPuzzleRecordModel}()
    linecounter = 1;
    
    # main -
    open(filename, "r") do io # open a stream to the file
        for line ∈ eachline(io) # read each line from the stream
            
           records[linecounter] = build(; record = line);
           linecounter = linecounter + 1; # update the counter

        end
    end

    # return the header and the records -
    return records;
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #