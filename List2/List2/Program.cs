using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List2
{
    class Program
    {
        static void Main(string[] args)
        {
            List<int> list = new List<int>();
            int c = 100;
            for(int i = 0; i < c; i++)
            {
                list.Push(i);
                list.Attach(2 * c - 1 - i);
            }
            while(!list.Empty())
            {
                Console.WriteLine(list.Detach());
                Console.WriteLine(list.Pull());
            }
            Dictionary<int, char> dict = new Dictionary<int, char>();
            for(int i = 0; i < c; i++)
            {
                dict.Push(i, (char)i);
            }
            Console.WriteLine(dict.Get(65));
            dict.Delete(65);
            Console.WriteLine(dict.Get(65));
        }
    }
}
