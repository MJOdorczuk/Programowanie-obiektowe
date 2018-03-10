using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PO_list2
{
    abstract class Stream
    {
        public Stream() { }
        public abstract Int32 Next();
        public abstract bool EOS();
        public abstract void Reset();

    }
}
