using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PO_list2
{
    class IntStream : Stream
    {
        protected Int32 current;

        public override bool EOS()
        {
            return (current == Int32.MaxValue);
        }

        public override Int32 Next()
        {
            current++;
            return --current;
        }

        public override void Reset()
        {
            current = 0;
        }
    }
}
