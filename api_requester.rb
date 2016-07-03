require 'HTTParty'

class ApiRequester
  def self.posts
    return enum_for(:posts) unless block_given?
    post = 1
    loop {
      puts post
      yield HTTParty.get("http://jsonplaceholder.typicode.com/posts/#{post}")
      post += 1
    }
  end
end
