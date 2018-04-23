class Function
  def initialize(fun)
    @fun = fun
  end
  def value(x)
    @fun.call(x)
  end
  def zeros(a,b,e)
    if a > b
      nil
    else
      zp = []
      steps = (b - a)/e + 1
      v1 = self.value(a)
      (1..steps).each{
        |i|
        v2 = v1
        v1 = self.value(i*e+a)
        if (v1 * v2 < 0 || v1 == 0)
          zp.push(i*e+a)
        end
      }
      if zp.size == 0
        nil
      else
        zp
      end
    end
  end
  def field(a,b)
    if(a > b)
      a,b=b,a
      sign = -1
    else
      sign = 1
    end
    step = 0.000001
    steps = (b - a)/step
    ret = 0
    (0...steps).each{
      |i|
      ret += self.value((i+0.5)*step+a)
    }
    ret *= sign * step
    ret
  end
  def df(x)
    dx = 0.000001
    (self.value(x+dx)-self.value(x-dx))/dx
  end
end

class Function2
  def initialize(fun)
    @fun = fun
  end
  def value(x,y)
    @fun.call(x,y)
  end
  def integral(a,b,c,d)
    if(a > b)
      a,b=b,a
    end
    if(c > d)
      c,d=d,c
    end
    step = 0.01
    stepsx = (b - a)/step
    stepsy = (d - c)/step
    ret = 0
    (0...stepsx).each{
      |x|
      (0...stepsy).each{
        |y|
        ret += self.value((x+0.5)*step+a,(y+0.5)*step+c)
      }
    }
    ret*step*step
  end
  def level(a,b,c,d,h)
    if(a > b)
      a,b=b,a
    end
    if(c > d)
      c,d=d,c
    end
    step = 0.01
    stepsx = (b - a)/step
    stepsy = (d - c)/step
    ret = []
    (0..stepsx).each{
      |x|
      (0..stepsy).each{
        |y|
        val = self.value(x*step+a,y*step+c)
        if (val - h).abs < step*10
          ret.push(x*step+a,y*step+c)
        end
      }
    }
    ret
  end
end

fun = Function.new(proc{|x|x*x*x})
puts fun.value(5)
puts fun.zeros(-1,1,0.003)
puts fun.field(1, -1)
puts fun.field(-1, 1)
puts fun.df(1)
puts fun.df(2)

fun2 = Function2.new(proc{|x,y| x*y*y})
puts fun2.value(5,3)
puts
puts fun2.integral(-1,2,-1,2)
puts
puts fun2.level(-1,2,-1,2,1)