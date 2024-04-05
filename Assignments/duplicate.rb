# Given an array with integer values you need to find all the duplicated numbers.
#     numbers = [1,2,2,3,4,5]
#     find_duplicates(numbers)
#     #output: [2]


def find_duplicates(arr)
  duplicate = []
  hash = arr.tally
  # puts hash
  hash.each do |key,value|
    if value >=2 
      duplicate.push(key)
    end
  end
  puts "Duplicate elements in array: #{duplicate}"
end

arr = [1,1,1,2,3,4,5,5,6,6]
find_duplicates(arr)