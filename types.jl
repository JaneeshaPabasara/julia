a=20 #Int64 
b=3.45 #Float64
c="Hello" #String
d=true  #Bool
h='x'  #Char
const y=3.14  #pie value is not changing its a constant and cant be changed

#explicit conversion
println(round(Int64,b)) #converting float to int

# try
#     x::Int64=4.23 #this will throw an error because we are trying to assign a float to an int variable
# catch e
#     println("Error is :" ,e)
# end

# y=33




#methods with $x - Interpolation
describe(x::Real)="$x isany real number"
describe(x::AbstractString)="$x is any string"
describe(x::Bool)="$x is true or false"

println(describe(3.14))
println(describe("Hello"))
println(describe(true))


# Write two functions:
#   1. row_means(M) — takes a 2D matrix, returns a vector of the mean of each row
#   2. col_stds(M) — takes a 2D matrix, returns a vector of the standard deviation of each column

#1.
function row_means(v)
       k=Float64[]
       r=0
       mean=0
       for r in eachrow(v)
       s=0
       for i in r
       s=s+i
       end
       mean=s/length(r)
       push!(k,mean)
       end
       return k
       end

#result
#        row_means(l)
# 2-element Vector{Float64}:
#  22.333333333333332
#  35.333333333333336

#2.
function col_stds(v)
       h=Float64[]
       sd=0
       for c in eachcol(v)
       s=0
       A=Float64[]
       ssqD=0
       diff=0
       m=0
       for j in c
       s=s+j
       end
       m=s/length(c)
       for j in c
       diff=(j-m)^2
       push!(A,diff)
       end
       for x in A
       ssqD=x+ssqD
       end
       sd=sqrt(ssqD/length(c))
       push!(h,sd)
       end
       return h
       end


#result
# col_stds(l)
# 3-element Vector{Float64}:
#   5.0
#   7.5
#  22.0