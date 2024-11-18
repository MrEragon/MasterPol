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
        public ListViewPage ListViewPage { get; set; }
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
                    Rating.Text = CurrentProduct.Rating.ToString();
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
            try
            {
                StringBuilder errors = new StringBuilder();

                if (string.IsNullOrEmpty(NameTextBox.Text))
                {
                    errors.AppendLine("Заполните наименование");
                }
                if (TypePartnerComboBox.SelectedItem == null)
                {
                    errors.AppendLine("Выберите тип партнера");
                }
                if (string.IsNullOrEmpty(Rating.Text))
                {
                    errors.AppendLine("Заполните рейтинг");
                }
                else
                {
                    var tryCount = Int32.TryParse(Rating.Text, out var resultCount);
                    if (!tryCount)
                    {
                        errors.AppendLine("Рейтинг - целое число");
                    }
                    else if (resultCount < 0)
                    {
                        errors.AppendLine("Рейтинг не должен быть отрицательный");
                    }
                }
                if (string.IsNullOrEmpty(CityTextBox.Text))
                {
                    errors.AppendLine("Заполните город");
                }
                if (string.IsNullOrEmpty(AreaTextBox.Text))
                {
                    errors.AppendLine("Заполните область");
                }
                if (string.IsNullOrEmpty(StreetTextBox.Text))
                {
                    errors.AppendLine("Заполните улицу");
                }
                if (string.IsNullOrEmpty(HouseTextBox.Text))
                {
                    errors.AppendLine("Заполните дом");
                }
                if (string.IsNullOrEmpty(LastNameBox.Text))
                {
                    errors.AppendLine("Заполните фамилию директора");
                }
                if (string.IsNullOrEmpty(FirstNameBox.Text))
                {
                    errors.AppendLine("Заполните имя директора");
                }
                if (string.IsNullOrEmpty(PhoneNumberTextBox.Text))
                {
                    errors.AppendLine("Заполните номер телефона");
                }
                else if (!PhoneNumberTextBox.Text.StartsWith("+"))
                {
                    errors.AppendLine("Номер телефона должен начинаться с + ");
                }
                if (string.IsNullOrEmpty(EmailTextBox.Text))
                {
                    errors.AppendLine("Заполните Email");
                }

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }


                

                var searchPartner = (from obj in Data.ProductsTrainingEntities.GetContext().NamePartner
                                  where obj.Name == NameTextBox.Text
                                  select obj).FirstOrDefault();

                if (searchPartner != null)
                {
                    CurrentProduct.IDNamePartner = searchPartner.ID;
                }
                else
                {
                    Data.NamePartner partnername = new Data.NamePartner()
                    {
                        Name = NameTextBox.Text
                    };
                    Data.ProductsTrainingEntities.GetContext().NamePartner.Add(partnername);
                    Data.ProductsTrainingEntities.GetContext().SaveChanges();

                    CurrentProduct.IDNamePartner = partnername.ID;
                }
                
                var selectedTypePartner = TypePartnerComboBox.SelectedItem as Data.TypePartner;
                
                CurrentProduct.IDTypePartner = selectedTypePartner.ID;
                CurrentProduct.Rating = Convert.ToInt32(Rating.Text);
                CurrentProduct.City = CityTextBox.Text;
                CurrentProduct.Area = AreaTextBox.Text;
                CurrentProduct.Street = StreetTextBox.Text;
                CurrentProduct.House = Convert.ToInt32(HouseTextBox.Text);
                CurrentProduct.DirectorLastName = LastNameBox.Text;
                CurrentProduct.DirectorFirstName = FirstNameBox.Text;
                CurrentProduct.DirectorPatronymic = PatronymicTextBox.Text;
                CurrentProduct.PhonePartner = PhoneNumberTextBox.Text;
                CurrentProduct.EmailPartner = EmailTextBox.Text;

                if (FlagAddOrEdit == "edit")
                {
                    Data.ProductsTrainingEntities.GetContext().SaveChanges();

                    MessageBox.Show("Успешно сохранено!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else if (FlagAddOrEdit == "add")
                {
                    Data.ProductsTrainingEntities.GetContext().Partners.Add(CurrentProduct);
                    Data.ProductsTrainingEntities.GetContext().SaveChanges();

                    MessageBox.Show("Успешно добавлено!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                }

                Classes.Manager.MainFrame.Navigate(new Pages.ListViewPage());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
