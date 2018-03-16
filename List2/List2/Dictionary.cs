using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List2
{
    class Dictionary<K,V>
    {
        Keyed<K, V> first;
        public void Push(K key, V value)
        {
            Keyed<K, V> newFirst = new Keyed<K, V>(value, key, this.first);
            this.first = newFirst;
        }
        public V Get(K key)
        {
            Keyed<K, V> pointer = this.first;
            if (pointer == null) return default(V);
            while (!pointer.Key().Equals(key))
            {
                pointer = pointer.Next();
                if (pointer == null) return default(V);
            }
            return pointer.Value();
        }
        public void Delete(K key)
        {
            Keyed<K, V> pointer = this.first;
            Keyed<K, V> previous = null;
            if (pointer == null) return;
            while (!pointer.Key().Equals(key))
            {
                previous = pointer;
                pointer = pointer.Next();
                if (pointer == null) return;
            }
            if (previous == null) this.first = this.first.Next();
            else previous.Next(pointer.Next());
        }
    }
}
