a=20 #Int64 
b=3.45 #Float64
c="Hello" #String
d=true  #Bool
h='x'  #Char
const y=3.14  #pie value is not changing its a constant and cant be changed

#explicit conversion
println(round(Int64,b)) #converting float to int

try
    x::Int64=4.23 #this will throw an error because we are trying to assign a float to an int variable
catch e
    println("Error is :" ,e)
end

y=33
y="hi"