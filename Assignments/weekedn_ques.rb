require 'date'

# you need to describe db design with ER diagram then you need to Implement that.


# Implement a module which would handle seller, buyer and products. Buyer and seller both would be users, they would be differentiate on the basis of their roles (buyer & seller).Products would be products which will belong to one of seller.

# Find the properties of buyer/seller and products.

# Buyer/Seller:
# # first_name
# # last_name
# # date_of_birth
# # address
# # role

# Here is the raw data regarding buyers and sellers:

# [
#  {:first_name => 'alex', :last_name => 'newman',  :date_of_birth => '01-05-  1982',  :address => 'sapna sangeeta', :role => 'buyer'},
#  {:first_name => 'alex', :last_name => 'Panc',  :date_of_birth => '12-04-  1990',  :address => 'bhanwar kua', :role => 'seller'},
#  {:first_name => 'Meena', :last_name => 'Pallanipppan',  :date_of_birth => '03-02-  1988',  :address => 'sapna sangeeta', :role => 'seller'},
#  {:first_name => 'Prabhu', :last_name => 'Sharma',  :date_of_birth => '11-02-  1992',  :address => 'geeta bhawan', :role => 'seller'},
#  {:first_name => 'Sundar', :last_name => 'Pichai',  :date_of_birth => '11-05-1983',  :address => 'vijay nagar', :role => 'buyer'}
# ]

# Products:
# # product_name
# # seller_name
# # price
# # category


# Here is the raw data regarding products:

# [
#  {:name => 'bicycle', :seller => 'alex', price => 3000, category: 'vehicle'},
#  {:name => 'car', :seller => 'meena', price => 250000, category: 'vehicle'},
#  {:name => 'jeans', :seller => 'prabhu', price => 1800, category: 'clothes'},
#  {:name => 'shirt', :seller => 'prabhu', price => 700, category: 'clothes'},
#  {:name => 'blue shirt', :seller => 'prabhu', price => 1200, category: 'clothes' },
#  {:name => 't-shirt', :seller => 'prabhu', price => 600, category: 'clothes'},
#  {:name => 'capri', :seller => 'prabhu', price => 300, category: 'clothes'},
#  {:name => 'bike', :seller => 'meena', price => 60000, category: 'vehicle'},
#  {:name => 'scooter', :seller => 'meena', price => 25000, category: 'vehicle'},
#  {:name => 'maruti', :seller => 'meena', price => 400000, category: 'vehicle'},
#  {:name => 'auto', :seller => 'meena', price => 100000, category: 'vehicle'},
#  {:name => 'sweter', :seller => 'prabhu', price => 1200, category: 'clothes'},
#  {:name => 'jacket', :seller => 'prabhu', price => 3500, category: 'clothes'},
#  {:name => 'hat', :seller => 'prabhu', price => 400, category: 'clothes'},
#  {:name => 'doll', :seller => 'alex', price => 350, category: 'toys'},
#  {:name => 'toy car', :seller => 'alex', price => 250, category: 'toys'},
#  {:name => 'bat', :seller => 'alex', price => 700, category: 'toys'},
#  {:name => 'ball', :seller => 'alex', price => 20, category: 'toys'},
#  {:name => 'batman', :seller => 'alex', price => 300, category: 'toys'},
#  {:name => 'barbi doll', :seller => 'alex', price => 3000, category: 'toys'}
# ]


# # Find below the functionality, that you need to implement for given scenario:
# Scenario: Take the list of all the users and return array of user objects correspond to the list.
# Parameters: list of all the users(hash) given above.
# Output: Return list of user objects

# Scenario: Take the list of all the products and return array of product objects correspond to the given list.
# Parameters: list of all the products(hash) given above.
# Output: Return list of product objects

# Scenario: Write method to get the full name of buyer (ex: suppose :first_name => 'alex' and  :last_name => 'newman'  of user, then full name would be 'Alex Neewman')
# Parameters: A buyer record for ex: {:first_name => 'Sundar', :last_name => 'Pichai',  :date_of_birth => '11-05-1983',  :address => 'vijay nagar', :role => 'buyer'}
# Output: "Sundar Pichai"

# Scenario: Write method to get the full name of buyer/seller
#  (ex: suppose :first_name => 'alex' and  :last_name => 'newman'  of user, then full name would be 'Alex Neewman')

# Scenario: Write method to find the age of buyer/seller on the basis of his date_of_birth
# Parameter: A buyer/seller record for ex: {:first_name => 'Sundar', :last_name => 'Pichai',  :date_of_birth => '11-05-1983',  :address => 'vijay nagar', :role => 'buyer'}
# Output: Return age of user after calculating from date_of_birth

# Scenario: Write a method in Buyer class, which will take all the users list as input and return buyers only
# Paramters: All the users given above
# Output: return array of all the buyer objects

# Scenario: Write a method in Seller class, which will take all the users list as input and return sellers only
# Paramters: All the users given above
# Output: return array of all the seller objects

# Scenario: Find all the users, whose first name is 'alex'
# Paramters: All the users list given above
# Output: return array of all the user objects whose first name is alex

module Weekend
  class User
    attr_accessor :users
    def initialize
      @users = [
        {:first_name => 'alex', :last_name => 'newman',  :date_of_birth => '01-05-1982',  :address => 'sapna sangeeta', :role => 'buyer'},
        {:first_name => 'alex', :last_name => 'Panc',  :date_of_birth => '12-04-1990',  :address => 'bhanwar kua', :role => 'seller'},
        {:first_name => 'Meena', :last_name => 'Pallanipppan',  :date_of_birth => '03-02-1988',  :address => 'sapna sangeeta', :role => 'seller'},
        {:first_name => 'Prabhu', :last_name => 'Sharma',  :date_of_birth => '11-02-1992',  :address => 'geeta bhawan', :role => 'seller'},
        {:first_name => 'Sundar', :last_name => 'Pichai',  :date_of_birth => '11-05-1983',  :address => 'vijay nagar', :role => 'buyer'}
      ]
    end

    def find_user_objects(user_list)
      @users.select { |u| user_list.include?(u[:first_name]) }
    end

    def get_buyer_fullname(buyer_name)
      user = @users.find { |user| user[:first_name] == buyer_name && user[:role] == 'buyer' }
      return "No buyer found with this name" unless user

      "#{user[:first_name].capitalize} #{user[:last_name].capitalize}"
    end

    def get_seller_fullname(seller_name)
      user = @users.find { |user| user[:first_name] == seller_name && user[:role] == 'seller' }
      return "No seller found with this name" unless user

      "#{user[:first_name].capitalize} #{user[:last_name].capitalize}"
    end

    def find_buyers_only(user_list)
      buyers = @users.select { |user| user_list.include?(user[:first_name]) && user[:role] == 'buyer' }
      buyers.uniq
    end

    def find_sellers_only(user_list)
      sellers = @users.select { |user| user_list.include?(user[:first_name]) && user[:role] == 'seller'}
      sellers.uniq
    end

    def find_user(user_name)
      all_users = @users.select { |user| user_name == user[:first_name] }
      all_users
    end

    def find_age(user)
      dob = Date.strptime(user[:date_of_birth], "%d-%m-%Y")
      now = Time.now.utc.to_date
      age = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
      age
    end
  end

  class Product
    attr_accessor :products
    def initialize
      @products = [
        {:name => 'bicycle', :seller => 'alex', :price => 3000, category: 'vehicle'},
        {:name => 'car', :seller => 'meena', :price => 250000, category: 'vehicle'},
        {:name => 'jeans', :seller => 'prabhu', :price => 1800, category: 'clothes'},
        {:name => 'shirt', :seller => 'prabhu', :price => 700, category: 'clothes'},
        {:name => 'blue shirt', :seller => 'prabhu', :price => 1200, category: 'clothes' },
        {:name => 't-shirt', :seller => 'prabhu', :price => 600, category: 'clothes'},
        {:name => 'capri', :seller => 'prabhu', :price => 300, category: 'clothes'},
        {:name => 'bike', :seller => 'meena', :price => 60000, category: 'vehicle'},
        {:name => 'scooter', :seller => 'meena', :price => 25000, category: 'vehicle'},
        {:name => 'maruti', :seller => 'meena', :price => 400000, category: 'vehicle'},
        {:name => 'auto', :seller => 'meena', :price => 100000, category: 'vehicle'},
        {:name => 'sweter', :seller => 'prabhu', :price => 1200, category: 'clothes'},
        {:name => 'jacket', :seller => 'prabhu', :price => 3500, category: 'clothes'},
        {:name => 'hat', :seller => 'prabhu', :price => 400, category: 'clothes'},
        {:name => 'doll', :seller => 'alex', :price => 350, category: 'toys'},
        {:name => 'toy car', :seller => 'alex', :price => 250, category: 'toys'},
        {:name => 'bat', :seller => 'alex', :price => 700, category: 'toys'},
        {:name => 'ball', :seller => 'alex', :price => 20, category: 'toys'},
        {:name => 'batman', :seller => 'alex', :price => 300, category: 'toys'},
        {:name => 'barbi doll', :seller => 'alex', :price => 3000, category: 'toys'}
      ]
    end

    def find_prduct_objects(product_list)
      product_objects = []
      product_list.each do |product|
        @products.each { |p| product_objects << p if p[:name] == product }
      end
      return product_objects
    end
  end
end

prod = Weekend::Product.new
user = Weekend::User.new
puts prod.products
puts user.users


# Scenario: Take the list of all the users and return array of user objects correspond to the list.
# Parameters: list of all the users(hash) given above.
# Output: Return list of user objects

puts user.find_user_objects(['alex','Meena'])



# Scenario: Take the list of all the products and return array of product objects correspond to the given list.
# Parameters: list of all the products(hash) given above.
# Output: Return list of product objects

puts prod.find_prduct_objects(['ball', 'bat', 'toy car', 'doll'])




# Scenario: Write method to get the full name of buyer (ex: suppose :first_name => 'alex' and  :last_name => 'newman'  of user, then full name would be 'Alex Neewman')
# Parameters: A buyer record for ex: {:first_name => 'Sundar', :last_name => 'Pichai',  :date_of_birth => '11-05-1983',  :address => 'vijay nagar', :role => 'buyer'}
# Output: "Sundar Pichai"

puts user.get_buyer_fullname('Sundar')




# Scenario: Write method to get the full name of buyer/seller
#  (ex: suppose :first_name => 'alex' and  :last_name => 'newman'  of user, then full name would be 'Alex Neewman')

puts user.get_seller_fullname('alex')




# Scenario: Write a method in Buyer class, which will take all the users list as input and return buyers only
# Paramters: All the users given above
# Output: return array of all the buyer objects

puts user.find_buyers_only(['alex', 'alex', 'Meena', 'Prabhu', 'Sundar'])




# Scenario: Write a method in Seller class, which will take all the users list as input and return sellers only
# Paramters: All the users given above
# Output: return array of all the seller objects

puts user.find_sellers_only(['alex', 'alex', 'Meena', 'Prabhu', 'Sundar'])



# Scenario: Find all the users, whose first name is 'alex'
# Paramters: All the users list given above
# Output: return array of all the user objects whose first name is alex

puts user.find_user('alex')



# Scenario: Write method to find the age of buyer/seller on the basis of his date_of_birth
# Parameter: A buyer/seller record for ex: {:first_name => 'Sundar', :last_name => 'Pichai',  :date_of_birth => '11-05-1983',  :address => 'vijay nagar', :role => 'buyer'}
# Output: Return age of user after calculating from date_of_birth


puts user.find_age({:first_name => 'alex', :last_name => 'newman',  :date_of_birth => '01-05-1982',  :address => 'sapna sangeeta', :role => 'buyer'})
puts user.find_age({:first_name => 'Meena', :last_name => 'Pallanipppan',  :date_of_birth => '03-02-1988',  :address => 'sapna sangeeta', :role => 'seller'})


puts "---------------------------------------------------------------------------------------------------------------------------------------"
puts user.users