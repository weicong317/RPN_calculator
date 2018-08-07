# Reverse Polish notation calculator
input = ARGV[0].split(" ") #input must have ""
index = 0

# unitl ans is out which is 1 integer
until input.size <= 1
  # the loop continue unless meet operator
  if input[index] === "+" || input[index] === "-" || input[index] === "*" || input[index] === "/"
    # separate the previous ans part and going to calculate part
    if index === 2
      # part 1 precious ans part
      part_1 = []
      # part 2 going to calculate part
      part_2 = input.slice(index+1,input.size-index)
    else
      part_1 = input.slice(0,index-2)
      part_2 = input.slice(index+1,input.size-index)
    end

    # based on operator, do operation
    if input[index] === "+"
      ans = input[index-2].to_i + input[index-1].to_i
    elsif input[index] === "-"
      ans = input[index-2].to_i - input[index-1].to_i
    elsif input[index] === "*"
      ans = input[index-2].to_i * input[index-1].to_i
    elsif input[index] === "/"
      ans = input[index-2].to_i / input[index-1].to_i
    end

    # join back 2 parts
    input = part_1.push(ans.to_s) + part_2
    index = 0
  else
    index += 1
  end
end

print "Answer: #{input[0]}"
puts "\n"