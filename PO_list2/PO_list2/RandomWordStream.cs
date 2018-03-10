using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PO_list2
{
    class RandomWordStream
    {
        public RandomWordStream()
        {
            prime = new PrimeStream();
        }

        private PrimeStream prime;

        public bool EOS()
        {
            return prime.EOS();
        }

        public string Next()
        {
            return Guid.NewGuid().ToString().Replace("-", string.Empty).Substring(0, prime.Next());
        }

        public void Reset()
        {
            prime = new PrimeStream();
        }
    }
}
