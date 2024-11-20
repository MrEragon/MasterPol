using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MasterPol.Pages
{
    /// <summary>
    /// Логика взаимодействия для ListViewPage.xaml
    /// </summary>
    public partial class ListViewPage : Page
    {
        public ListViewPage()
        {
            InitializeComponent();
            Init();
        }

        public void Init()
        {
            ViewPartner.ItemsSource = Data.ProductsTrainingEntities.GetContext().Partners.ToList();
        }
        public List<Data.Partners> _currentProducts = Data.ProductsTrainingEntities.GetContext().Partners.ToList();
        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddorEditPage((sender as Button).DataContext as Data.Partners));
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddorEditPage(null));
        }

        private void HistoryButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.HistoryPage());
        }

        private void DiscountBox_Loaded(object sender, RoutedEventArgs e)
        {
            var discountbox = sender as TextBlock;
            var partner = discountbox.DataContext as Data.Partners;

            try
            {
                if (partner != null)
                {
                    if (partner.Discount == null)
                    {
                        var countproduction = Data.ProductsTrainingEntities.GetContext().PartnerProducts
                            .Where(d => d.IDNamePartner == partner.IDNamePartner)
                            .Sum(d => d.CountProduction);

                        int discount = 0;
                        if (countproduction >= 300000)
                        {
                            discount = 15;
                        }
                        else if (countproduction >= 50000)
                        {
                            discount = 10;
                        }
                        else if (countproduction >= 10000)
                        {
                            discount = 5;
                        }
                        else
                        {
                            discount = 0;
                        }
                        partner.Discount = discount;
                    }

                    discountbox.Text = $"{partner.Discount}%";

                    discountbox.Loaded -= DiscountBox_Loaded;
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}
