def muppets
  Enumerator.new do |yielder|
    yielder.yield 'Animal'
    yielder.yield 'Kermit'
    yielder.yield 'Piggy'
    yielder.yield 'Fuzzy Bear'
  end
end
