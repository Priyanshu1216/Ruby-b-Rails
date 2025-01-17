# Suppose you have a hash h = { a:1, b:2, c:3, d:4, e:6 }
#     1. Get the value of key `:b`.
#     2. Add to this hash the key:value pair `{f:5}`
#     3. Remove all key:value pairs whose value is less than 5.5




h = {
  a:1,
  b:2,
  c:3,
  d:4,
  e:5,
}

# 1.Get the value of key `:b`

def get_value(hash,key)
  key =  key.to_sym
  return hash[key]
end

puts get_value(h,'b')



# 2. Add to this hash the key:value pair `{f:5}`

def merge_hash(hash,new_hash)
  return hash.merge(new_hash)
end


puts merge_hash(h,{f:6})



# 3. Remove all key:value pairs whose value is less than 5.5

def remove_pair(hash,value)
  hash.reject do |key,value|
    value < 5
  end
end

puts remove_pair(h,5)
puts h