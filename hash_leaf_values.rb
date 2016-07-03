class Hash

  def leaf_values
    each_leaf.to_a
  end

  def each_leaf
    return to_enum(:each_leaf) unless block_given?
    each_value do |value|
      value.is_a?(Hash) ? value.each_leaf.each{ |leaf| yield leaf } : (yield value)
    end
  end
end
