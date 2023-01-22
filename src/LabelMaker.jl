module LabelMaker

import Base.peek
export IntLabel, StringLabel, next!, peek

"""
    IntLabel(start::Int = 0)

Create a new label maker where the first value to be returned is `start`.
"""
mutable struct IntLabel
    next_label::Int  # this is an unused label

    function IntLabel(start::Int = 0)
        new(start)
    end

end

"""
    next!(L::IntLabel)::Int
    next!(L::StringLabel)::String

Return a new, unused label. 
"""
function next!(L::IntLabel)::Int
    out = peek(L)
    L.next_label += 1
    return out
end

"""
    peek(L::IntLabel)::Int
    peek(L::StringLabel)::String

Return the next label to be created without advancing. User 
should probably not use this method, but rather `next!(L)`.
"""
function peek(L::IntLabel)::Int
    L.next_label
end

"""
    StringLabel(prefix::String = "label-", padding::Int = 6, start::Int = 0)

Return a new label maker where the starting value is `start` and is of the form
`label-000000`.
"""
mutable struct StringLabel
    next_label::Int
    prefix::String
    pad::Int

    function StringLabel(prefix::String = "label-", padding::Int = 6, start::Int = 0)
        new(start, prefix, padding)
    end
end

function peek(L::StringLabel)::String
    return L.prefix * string(L.next_label, pad = L.pad)
end

function next!(L::StringLabel)::String
    if L.next_label >= 10^L.pad
        error("No more labels possible.")
    end

    out = peek(L)
    L.next_label += 1
    return out
end

end # module LabelMaker
