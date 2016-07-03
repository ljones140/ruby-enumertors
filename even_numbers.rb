class EvenNumbers
  def self.numbers
    return enum_for(:numbers) unless block_given?
    n = 2
    loop do
      yield n
      n += 2
    end
  end
end
