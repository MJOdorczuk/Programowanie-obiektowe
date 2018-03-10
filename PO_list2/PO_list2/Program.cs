using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PO_list2
{
    class Program
    {
        static void Main(string[] args)
        {
            RandomWordStream rws = new RandomWordStream();
            PrimeStream rs = new PrimeStream();
            Array a = new Array(0, 12);
            a.Set(5, -23);
            a.Set(15, 20);
            Console.WriteLine(a.Get(5));
            Console.WriteLine(a.Get(15));
            /*
            Console.WriteLine(rs.Next());
            Console.WriteLine(rs.Next());
            Console.WriteLine(rs.Next());
            Console.WriteLine(rs.Next());
            Console.WriteLine(rs.Next());
            Console.WriteLine(rs.Next());
            Console.WriteLine(rs.Next());
            Console.WriteLine(rs.Next());
            Console.WriteLine(rws.Next());
            Console.WriteLine(rws.Next());
            Console.WriteLine(rws.Next());
            Console.WriteLine(rws.Next());
            Console.WriteLine(rws.Next());*/
            Console.ReadLine();
        }
    }
}
