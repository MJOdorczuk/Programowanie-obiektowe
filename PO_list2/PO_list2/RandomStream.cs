using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PO_list2
{
    class RandomStream : Stream
    {
        public RandomStream()
        {
            rnd = new Random();
        }

        private Random rnd;

        public override bool EOS()
        {
            return false;
        }

        public override int Next()
        {
            return rnd.Next();
        }

        public override void Reset()
        {
        }
    }
}
