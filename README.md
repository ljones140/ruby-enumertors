# Ruby Enumerators
### Practicing creating enumerators in ruby
This repo is for my own personal practice of making ruby enumerators. There are
several enumerable examples.  

I used these resources for help:  
* [Stop including Enumerable](http://blog.arkency.com/2014/01/ruby-to-enum-for-enumerator/)  
* [Ruby Tapas enumerator](http://devblog.avdi.org/2013/09/10/rubytapas-freebie-enumerator/)  

Returning enumerators from methods allows more control over collections. It's
more efficient to return an enumerator as you can take the elements from the
collection as you like. You do not have to take the entire collection.

There are three ways to create an enumerator:
* Kernel#to_enum
* Kernel#enum_for
* Enumerator.new
```ruby
def muppets
  Enumerator.new do |yielder|
    yielder.yield 'Animal'
    yielder.yield 'Kermit'
    yielder.yield 'Piggy'
    yielder.yield 'Fuzzy Bear'
  end
end

muppets_enum = muppets
muppets_enum.entries # => ["Animal", "Kermit", "Piggy", "Fuzzy Bear"]
 ```
This is a basic enumerator that returns an enumerable collection of muppets.
What is happening is an instance of enumerator is created which will have all of
the [enumerator methods](http://ruby-doc.org/core-2.2.0/Enumerator.html). I have
manually defined in this enumerator that the yielder will yield a 4 differnt
muppets as the enumerator is traversed.

`muppet_enum.entries` Goes through the enumerator yielding them and collecting
them in an array.
However you can choose to yield only the elements that you want from your
enumerator. Here we can call next on the enumerator which yields the next
element until the enumerator ends.
```ruby
muppets_enum.next 
=> "Animal"
muppets_enum.next 
=> "Kermit"
muppets_enum.next 
=> "Piggy"
muppets_enum.next 
=> "Fuzzy Bear"
muppets_enum.next 
=> StopIteration: iteration reached an end
```
A `StopIteration` error is received when the enumerator has yielded all it's
elements.

A benefit of this approach is enumerators can be returned that have infinite
elements however you can take as need and the enumerator will only yield the
parts it requires.
```ruby
def even_numbers
  return enum_for(:numbers) unless block_given?
  number = 2
  loop do
    yield number
    number += 2
  end
end
```
This method will return an infinite enumerator of even numbers. If you want the
first 10 even numbers rather than creating an never array that calculates all
numbers you can take the elements as you require from the enumerator.
```ruby
even_numbers.take(10)
=> [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
```
