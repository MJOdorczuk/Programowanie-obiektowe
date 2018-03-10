using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PO_list2
{
    class PrimeStream : Stream
    {
        public PrimeStream()
        {
            primes = new List<Int32>();
            end = false;
        }

        private List<Int32> primes;
        private bool end;

        public override bool EOS()
        {
            return end;
        }

        public override int Next()
        {
            if(primes.LongCount() == 0)
            {
                primes.Add(2);
                primes.Add(3);
                return 2;
            }
            Int32 ret = primes.Last<Int32>();
            if (end) return ret;
            Int32 a = ret;
            bool isntPrime = true;
            while(isntPrime)
            {
                isntPrime = false;
                a++;
                if (a < 0)
                {
                    end = true;
                    return ret;
                }
                for (int i = 0; i < primes.LongCount(); i++)
                {
                    if (a % primes.ElementAt<Int32>(i) == 0)
                    {
                        isntPrime = true;
                        break;
                    }
                }
            }
            primes.Add(a);
            return ret;
        }

        public override void Reset()
        {
            primes = new List<Int32>();
            end = false;
        }
    }
}
