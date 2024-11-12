using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MasterPolAccountManager
{
    internal class Program
    {
        static void Main(string[] args)
        {
            CalculateMaterial calculateMaterial = new CalculateMaterial();
            Console.WriteLine(calculateMaterial.Calculate(1, 1, 3, 12.8, 13.9));

            Console.ReadKey();
        }
    }
}
