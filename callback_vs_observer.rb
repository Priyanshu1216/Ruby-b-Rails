Rails Callback:

Callbacks are methods, which can be called at certain moments of an object’s life cycle.
for example - it can be called when an object is created, updated, deleted.
A call back is short lived.

Types of Callbacks: 
Rails provides various types of callbacks such as before_validation- 

after_validation, before_save, after_save, before_create, after_create, before_update, after_update, before_destroy, after_destroy, etc.

class User < ApplicationRecord
  before_save :normalize_name


  private

  def normalize_name
    self.name = name.downcase
  end
end




Rails Observers:

Observers is same like Callback in rails, but it is used when method is not directly associated to object life cycle.
Also, the observer lives longer, and it can be detached or attached at any time.

Example:

Create your observer with following command :

$ rails g observer User


This will create new file with name user_observer.rb
Then in this file define the models you wish to observe [One Observer can observe multiple models] and then add the before_save callback.


class UserObserver < ActiveRecord::Observer
  observe :user, :customer
 
  def before_save(user)
    user.name = user.name.downcase
  end
end