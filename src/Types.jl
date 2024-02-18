"""
    MyPuzzleRecordModel

TODO: Add documentation
Mutable struct with three fields:
    record::String - single encoded line of text
    characters::Array{Char, 1} - the characters of the line of text
    len::Int64 - the length (number of characters) of the line of text
"""
mutable struct MyPuzzleRecordModel

    # data fields
    record::String
    characters::Array{Char, 1}
    len::Int64

    # constructor: builds a new empty MyPuzzleRecordModel
    MyPuzzleRecordModel() = new()
end