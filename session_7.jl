# Write a function group_by(data, key_fn) that takes a vector of values and a function, and returns a Dict where each
#   key is a computed group label and each value is a vector of items in that group. For example, group_by([1, -2, 3, -4,
#   0], sign) should return Dict(1 => [1, 3], -1 => [-2, -4], 0 => [0])

#Dict — keyed lookup, built up with get! + push

function group_by(d,key_fn)
       dd=Dict{Any, Vector{Any}}()
       for i in d
       v=get!(dd,key_fn(i),[])
       push!(v,i)
       end
       return dd
       end

group_by(v,sign)
# Dict{Any, Vector{Any}} with 3 entries:
#   0  => [0, 0]
#   -1 => [-3, -4]
#   1  => [1, 5, 3]

#set -membership, no duplicates, O(1) lookup
s = Set([1, 2, 2, 3])  # => Set([1, 2, 3])

#NamedTuple — anonymous grouped data, immutable, perfect for return values
nt=(name="jane",product="bag",qty=3,price=69.40)
nt.product   #"bag"
nt[:price]    #69.4
