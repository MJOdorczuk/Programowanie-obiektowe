using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PO_list2
{
    class Array
    {
        private Int32 value;
        private Array next, previous, last;
        private UInt16 lastIndex;

        public Array(Array previous)
        {
            this.previous = previous;
            this.next = null;
            this.last = this;
            lastIndex = 0;
        }
        public Array(UInt16 begin, UInt16 end, Array previous)
        {
            this.previous = previous;
            if (begin < end) this.next = new Array(++begin, end, this);
            this.last = this;
            lastIndex = 0;
        }
        public Array(UInt16 begin, UInt16 end)
        {
            this.previous = null;
            if (begin < end) this.next = new Array(++begin, end, this);
            this.last = this;
            lastIndex = 0;
        }
        public Array Next()
        {
            return this.next;
        }
        protected void SetNext(Array next)
        {
            this.next = next;
        }
        public void Set(UInt16 index, Int32 value)
        {
            Array toSet = this;
            int ind = 0;
            if (lastIndex <= index)
            {
                ind = lastIndex;
                toSet = last;
            }
            for (int i = ind; i < index; i++)
            {
                if (toSet.Next() == null) toSet.SetNext(new Array(toSet));
                toSet = toSet.Next();
            }
            last = toSet;
            lastIndex = index;
            toSet.Set(value);
        }
        public void Set(Int32 value)
        {
            this.value = value;
        }
        public Int32 Get()
        {
            return this.value;
        }
        public Int32 Get(UInt16 index)
        {
            Array toGet = this;
            UInt16 ind = 0;
            if (lastIndex <= ind)
            {
                toGet = last;
                ind = lastIndex;
            }
            for (int i = 0; i < index; i++)
            {
                toGet = toGet.Next();
                if (toGet == null) throw new Exception("End of list");
            }
            last = toGet;
            lastIndex = index;
            return toGet.Get();
        }
    }
}
