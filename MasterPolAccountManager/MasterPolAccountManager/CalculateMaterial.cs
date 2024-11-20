using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MasterPolAccountManager
{
    public class CalculateMaterial
    {
        public int Calculate(int IdTypeOfProduct, int IdTypeOfMaterial,
            int CountProducts, double param1, double param2)
        {
            try
            {
                double countOn1 = param1 * param2 * Convert.ToDouble((Data.ProductsTrainingEntities.GetContext().ProductType
                    .Where(d => d.ID == IdTypeOfProduct).FirstOrDefault().Coeff));

                countOn1 += (param1 * param2 * Convert.ToDouble(Data.ProductsTrainingEntities.GetContext().ProductType
                    .Where(d => d.ID == IdTypeOfProduct).FirstOrDefault().Coeff) *
                    Convert.ToDouble(Data.ProductsTrainingEntities.GetContext().TypeMaterial
                    .Where(d => d.ID == IdTypeOfMaterial).FirstOrDefault().Percantage));

                int result = Convert.ToInt32(Math.Round(countOn1 * CountProducts));
                return result;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return -1;
            }
        }
    }
}
