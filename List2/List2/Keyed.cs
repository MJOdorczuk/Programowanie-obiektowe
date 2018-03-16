using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List2
{
    class Keyed<K,V>
    {
        private K key;
        private V value;
        private Keyed<K, V> next;
        public Keyed(V value, K key)
        {
            this.value = value;
            this.key = key;
        }
        public Keyed(V value, K key, Keyed<K, V> next)
        {
            this.value = value;
            this.key = key;
            this.next = next;
        }
        public Keyed<K, V> Next()
        {
            return this.next;
        }
        public void Next(Keyed<K, V> next)
        {
            this.next = next;
        }
        public K Key()
        {
            return this.key;
        }
        public V Value()
        {
            return this.value;
        }
    }
}
