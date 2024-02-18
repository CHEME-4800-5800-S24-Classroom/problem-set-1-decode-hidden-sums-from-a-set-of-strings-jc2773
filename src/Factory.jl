
# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE =================================================================================== #
# TODO: Make a build method to construct MyPuzzleRecordModel types
function build(; record::String = "abc")::MyPuzzleRecordModel
    # check: check to see if the parameter is valid
    @assert isempty(record) == false "String cannot be empty"

    # create a MyPuzzleRecordModel
    model = MyPuzzleRecordModel()
    model.record = record;
    model.characters = collect(record); # make an array of characters
    model.len = length(record);

    # return
    return model;
end

# ===== PUBLIC METHODS ABOVE HERE =================================================================================== #