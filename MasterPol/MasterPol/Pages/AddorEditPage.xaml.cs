using MasterPol.Data;
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
    /// Логика взаимодействия для AddorEditPage.xaml
    /// </summary>
    public partial class AddorEditPage : Page
    {
        public string FlagAddOrEdit = "default";
        public Data.Partners CurrentProduct {  get; set; }
        public AddorEditPage(Data.Partners selectedPartner)
        {
            InitializeComponent();
           

            if (selectedPartner == null)
            {
                FlagAddOrEdit = "add";
            }
            else
            {
                CurrentProduct = selectedPartner;
                FlagAddOrEdit = "edit";
            }

            DataContext = CurrentProduct;
            Init();
        }

        private void Init()
        {
            try
            {
                TypePartnerComboBox.ItemsSource = Data.ProductsTrainingEntities.GetContext().TypePartner.ToList();

                if (FlagAddOrEdit == "add")
                {
                    NameTextBox.Text = string.Empty;
                    TypePartnerComboBox.SelectedItem = null;
                    Rating.Text = string.Empty;
                    CityTextBox.Text = string.Empty;
                    AreaTextBox.Text = string.Empty;
                    StreetTextBox.Text = string.Empty;
                    HouseTextBox.Text = string.Empty;
                    LastNameBox.Text = string.Empty;
                    FirstNameBox.Text = string.Empty;
                    PatronymicTextBox.Text = string.Empty;
                    PhoneNumberTextBox.Text = string.Empty;
                    EmailTextBox.Text = string.Empty;
                }
                else if (FlagAddOrEdit == "edit")
                {
                    NameTextBox.Text = CurrentProduct.NamePartner.Name;
                    TypePartnerComboBox.SelectedItem = Data.ProductsTrainingEntities.GetContext().TypePartner.Where(d => d.ID == CurrentProduct.IDTypePartner).FirstOrDefault();
                    Rating.Text = CurrentProduct.NamePartner.Name;
                    CityTextBox.Text = CurrentProduct.City;
                    AreaTextBox.Text = CurrentProduct.Area;
                    StreetTextBox.Text = CurrentProduct.Street;
                    HouseTextBox.Text = CurrentProduct.House.ToString();
                    LastNameBox.Text = CurrentProduct.DirectorLastName;
                    FirstNameBox.Text = CurrentProduct.DirectorFirstName;
                    PatronymicTextBox.Text = CurrentProduct.DirectorPatronymic;
                    PhoneNumberTextBox.Text = CurrentProduct.PhonePartner;
                    EmailTextBox.Text = CurrentProduct.EmailPartner;
                }
            }
            catch
            {

            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
