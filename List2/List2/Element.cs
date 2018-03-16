using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List2
{
    class Element<T>
    {
        private T value;
        private Element<T> next;
        private Element<T> previous;

        public Element(T value)
        {
            this.value = value;
        }
        public Element(T value, Element<T> previous, Element<T> next)
        {
            this.value = value;
            this.next = next;
            this.previous = previous;
        }
        public Element<T> Next()
        {
            return this.next;
        }
        public Element<T> Previous()
        {
            return this.previous;
        }
        public void Next(Element<T> next)
        {
            this.next = next;
        }
        public void Previous(Element<T> previous)
        {
            this.previous = previous;
        }
        public T Value()
        {
            return this.value;
        }
    }
}
