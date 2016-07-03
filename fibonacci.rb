def fibonacci
  return enum_for(:fibonacci) unless block_given?
  a = b = 1
  loop do
    yield a
    a, b = b, a + b
  end
end
