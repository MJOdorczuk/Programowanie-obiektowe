class Fixnum
  def factors
    factors = []
    (1..self).each do |i|
      if self % i == 0
        factors.push(i)
      end
    end
    factors
  end
  def ack(y)
    if self == 0 then y + 1
      else if y == 0 then (self - 1).ack(1)
             else (self - 1).ack(self.ack(y-1))
           end
    end
  end
  def perfect
    sum = 0
    self.factors.each do |n|
      sum += n
    end
    if sum == 2 * self then true
      else false
    end
  end
  def in_words
    translator ={
        '0' => "zero",
        '1' => "one",
        '2' => "two",
        '3' => "three",
        '4' => "four",
        '5' => "five",
        '6' => "six",
        '7' => "seven",
        '8' => "eight",
        '9' => "nine"
    }
    ret = []
    self.to_s.each_char do |i|
      ret.push(translator[i])
    end
    ret
  end
end


print 8.factors
puts
print 2.ack(1)
puts
print 1.perfect
puts
print 564.in_words
puts