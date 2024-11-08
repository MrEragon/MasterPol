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
    /// Логика взаимодействия для HistoryPage.xaml
    /// </summary>
    public partial class HistoryPage : Page
    {
        public HistoryPage()
        {
            InitializeComponent();

            Init();

        }

        public void Init()
        {
            HistoryDataGrid.ItemsSource = Data.ProductsTrainingEntities.GetContext().PartnerProducts.ToList();

            var ProduceList = Data.ProductsTrainingEntities.GetContext().NamePartner.ToList();
            ProduceList.Insert(0, new Data.NamePartner { Name = "Все партнеры" });
            PartnerSortComboBox.ItemsSource = ProduceList;
            PartnerSortComboBox.SelectedIndex = 0;

        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }
    }
}
