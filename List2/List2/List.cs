using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List2
{
    class List<T>
    {
        private Element<T> first;
        private Element<T> last;
        public void Push(T value)
        {
            if(this.first == null)
            {
                this.first = new Element<T>(value, null, null);
                this.last = new Element<T>(value, null, null);
            }
            else
            {
                Element<T> newFirst = new Element<T>(value, null, this.first);
                this.first.Previous(newFirst);
                this.first = newFirst;
            }
        }
        public void Attach(T value)
        {
            if(this.last == null)
            {
                this.first = new Element<T>(value, null, null);
                this.last = new Element<T>(value, null, null);
            }
            else
            {
                Element<T> newLast = new Element<T>(value, this.last, null);
                this.last.Next(newLast);
                this.last = newLast;
            }
        }
        public T Pull()
        {
            Element<T> temp = this.first;
            if (this.first == null) return default(T);
            if (this.first == this.last)
            {
                this.first = null;
                this.last = null;
            }
            else
            {
                this.first = this.first.Next();
                if(this.first != null) this.first.Previous(null);
            }
            return temp.Value();
        }
        public T Detach()
        {
            Element<T> temp = this.last;
            if (this.last == null) return default(T);
            if (this.last == this.first)
            {
                this.first = null;
                this.last = null;
            }
            else
            {
                this.last = this.last.Previous();
                this.last.Next(null);
            }
            return temp.Value();
        }
        public bool Empty()
        {
            return this.first == null;
        }
    }
}
