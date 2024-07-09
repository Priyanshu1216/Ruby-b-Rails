# Create a class called "Person" with attributes name and age. Implement a method called "introduce" that displays the person's name and age using the "self" keyword.


class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def introduce
    "#{self.name} is #{self.age} years old"
  end

  def set_name_age(name, age)
    self.name = name
    self.age = age
  end
end

p1 = Person.new("Soham", 28)
puts p1.introduce
p1.set_name_age("Radhe", 27)
puts p1.introduce
