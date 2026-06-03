#  Create a plain text file called sample.txt with at least 10 words spread across 3-4 lines
#Task
#  read the file line by line, split each line into words, and count how many times each word appears

function count_words(filepath)
         open(filepath,"r") do f
                k=[]
                L=[]
                d=Dict{String, Int}()
                for line in eachline(f)
                s=split(line)
                append!(k,s)
                end
                for x in k
                x=lowercase(x)
                push!(L,x)
                end
                for j in L
                d[j]=get(d , j, 0)+1
                end
                return d
                end
                end
#call func
count_words("D:/julia/sample.txt")
#result
#  "pencil" => 2
#   "run"    => 1
#   "kite"   => 3
#   "bed"    => 4
#   "tree"   => 1
#   "jack"   => 2
#   "flower" => 1