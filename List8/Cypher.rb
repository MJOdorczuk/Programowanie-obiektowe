class Cyphered
  def initialize(cypher)
    @cypher = cypher
  end
  def to_s
    @cypher
  end
  def decypher(key)

  end
end

class Public
  def initialize(message)
    @message = message
  end
  def cypher(key)
    ret = []
    @message.each_char do |c|
      ret.push(key[c])
    end
    Cyphered.new(ret.join(""))
  end
  def to_s
    @message
  end
end

class Cyphered
  def decypher(key)
    ret = []
    @cypher.each_char do |c|
      ret.push(key.key(c))
    end
    Public.new(ret.join(""))
  end
end

key = {
    'a' => 'b',
    'b' => 'c',
    'c' => 'a'
}

p = Public.new("abc")
c = Cyphered.new("abc")
b = c.decypher(key)
a = c.decypher(key).cypher(key)
d = p.cypher(key)
e = p.cypher(key).decypher(key)

puts "original cypher is " + c.to_s
puts "decyphred : " + b.to_s
puts "recyphred : " + a.to_s
puts "original message is " + p.to_s
puts "cyphred : " + d.to_s
puts "regain : " + e.to_s

