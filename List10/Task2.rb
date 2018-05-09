class Element2
  def initialize(val)
    @val = val
    @next = nil
    @prev = nil
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

class Collection2
  def initialize
    @first = nil
    @last = nil
  end
  def put(val)
    if(@first == nil)
      @first = Element2.new(val)
      @last = @first
    else
      current = @first
      set = false
      until set
        cv = current.getVal
        if(cv > val)
          prev = current.getPrev
          elem = Element2.new(val)
          if(prev == nil)
            @first = elem
          else
            prev.setNext(elem)
          end
          elem.setPrev(prev)
          elem.setNext(current)
          current.setPrev(elem)
          set = true
        end
        current = current.getNext
        if(current == nil && !(set))
          elem = Element2.new(val)
          elem.setPrev(@last)
          @last.setNext(elem)
          @last = elem
          set = true
        end
      end
    end
  end
  def get(i)
    l = self.length
    if(i >= l || @first == nil)
      throw ("Too far")
    end
    if(i > l/2)
      index = l - 1
      current = @last
      while i < index
        current = current.getPrev
        index -= 1
      end
    else
      index = 0
      current = @first
      while i > index
        current = current.getNext
        index += 1
      end
    end
    current.getVal
  end
  def length
    current = @first
    index = 0
    until current == nil
      current = current.getNext
      index += 1
    end
    index
  end
  def remove(i)
    l = self.length
    if(i < l || @first == nil)
      if(i < l/2)
        index = 0
        current = @first
        while index < i
          current = current.getNext
          index += 1
        end
      else
        index = l - 1
        current = @last
        while index > i
          current = current.getPrev
          index -= 1
        end
      end
      p = current.getPrev
      n = current.getNext
      v = current.getVal
      if(p == nil)
        @first = n
      else
        p.setNext(n)
      end
      if(n == nil)
        @last == p
      else
        n.setPrev(p)
      end
      v
    end
  end
  def put_list(list)
    list.each do |val|
      self.put(val)
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
end

class Seeker
  def bsa(c,val)
    lb = 0
    ub = c.length - 1
    v = c.get(ub)
    if(v > val)
      while lb != ub
        puts lb.to_s + " to " + ub.to_s
        i = ((ub + lb)/2).to_int
        v = c.get(i)
        if(v > val)
          ub = i
        else
          if(lb == i)
            lb += 1
          else
            lb = i
          end
        end
      end
    end
    if(v == val)
      v
    else
      throw "Not found!"
    end
  end
  def isa(c,val)
    lb = 0
    ub = c.length - 1
    v = c.get(ub)
    if(v > val)
      while lb != ub
        i = (lb + ((val - c.get(lb))*(ub - lb)/(c.get(ub) - c.get(lb)))).to_int
        v = c.get(i)
        if(v == val)
          ub = lb = i
        else
          if(v > val)
            ub = i
          else
            if(lb == i)
              lb += 1
            else
              lb = i
            end
          end
        end
      end
    end
    if(v == val)
      v
    else
      throw "Not found"
    end
  end
end

c = Collection2.new
list = [2,3,1,15,5,4,10,6,5]
c.put_list(list)
puts c.to_list.to_s
puts Seeker.new().bsa(c,5)
puts c.to_list.to_s
puts Seeker.new().isa(c,6)