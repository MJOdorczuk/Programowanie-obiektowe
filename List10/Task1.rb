class Element
  def initialize(val, prev)
    @val = val
    @prev = prev
  end
  def setPrev(prev)
    @prev = prev
  end
  def setNext(sequent)
    @next = sequent
  end
  def setVal(val)
    @val = val
  end
  def getPrev
    @prev
  end
  def getNext
    @next
  end
  def getVal
    @val
  end
end

class Collection
  def initialize
    @first = nil
    @current = nil
    @index = 0
  end
  def get(i)
    if(@index > i)
      @current = @first
      @index = 0
    end
    while i > @index
      if(@current == nil)
        throw ("Too far")
      end
      @current = @current.getNext
      @index += 1
    end
    @current.getVal
  end
  def length
    until @current == nil
      @current = @current.getNext
      @index += 1
    end
    @index
  end
  def put(val,i)
    if(i == 0)
      elem = Element.new(val,nil)
      if(@first != nil)
        @first.setPrev(elem)
      end
      elem.setNext(@first)
      @first = elem
      @current = @first
      @index = 0
    else
      if(@index > i)
        @index = 0
        @current = @first
      end
      while i > @index + 1
        if(@current == nil)
          throw("Too far!")
        end
        @current = @current.getNext
        @index += 1
      end
      elem = Element.new(val,@current)
      elem.setNext(@current.getNext)
      nxt = elem.getNext
      if(nxt != nil)
        nxt.setPrev(elem)
      end
      @current.setNext(elem)
      elem.setPrev(@current)
    end
  end
  def remove(i)
    if(@index > i)
      @index = 0
      @current = @first
    end
    while @index < i
      if(@current == nil)
        throw ("Too far")
      end
      @current = @current.getNext
      @index += 1
    end
    p = @current.getPrev
    n = @current.getNext
    v = @current.getVal
    if(p == nil)
      @first = n
      @current = n
      @index = 0
    else
      @current = p
      @index -= 1
      p.setNext(n)
    end
    if(n != nil)
      n.setPrev(p)
    end
    v
  end
  def put_list(list)
    l = self.length
    (0...list.length).each do |i|
      self.put(list.at(i),l+i)
    end
  end
  def to_list
    l = self.length
    ret = []
    (0...l).each do |i|
      ret.push(self.get(i))
    end
    ret
  end
  def swap(i,j)
    if(i != j)
      if(i > j)
        i, j = j, i
      end
      ej = remove(j)
      ei = remove(i)
      self.put(ej,i)
      self.put(ei,j)
    end
  end
end

class Sorting
  def sorted?(c)
    sorted = true
    l = c.length
    if(l > 0)
      v1 = c.get(0)
      i = 1
      while i < l && sorted
        v2 = c.get(i)
        if(v2 < v1)
          sorted = false
        end
        v1 = v2
        i += 1
      end
    end
    sorted
  end
  def bubbleSort(c)
    l = c.length
    if(l > 1)
      while l > 1
        h = 0
        v1 = c.get(0)
        (1...l).each do |i|
          v2 = c.get(i)
          if(v1 > v2)
            c.swap(i,i-1)
            h = i
            v2 = v1
          end
          v1 = v2
        end
        l = h
      end
    end
  end
  def worstSort(c)
    l = c.length
    until sorted?(c)
      c.swap(rand(l),rand(l))
    end
  end
end

c1 = Collection.new
c2 = Collection.new
list = [2,3,1,15,5,4,10,6,5]
c1.put_list(list)
c2.put_list(list)

puts "before sort:\n" + c1.to_list.to_s

Sorting.new.bubbleSort(c1)
Sorting.new.worstSort(c2)

puts "\nAfter bubble sort:\n" + c1.to_list.to_s
puts "\nAfter worst sort:\n" + c2.to_list.to_s
