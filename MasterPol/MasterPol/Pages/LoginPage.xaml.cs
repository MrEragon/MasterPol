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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private async void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(LoginBox.Text))
                {
                    errors.AppendLine("Заполните логин");
                }
                if (string.IsNullOrEmpty(PasswordTextBox.Password))
                {
                    errors.AppendLine("Заполните пароль");
                }

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (Data.ProductsTrainingEntities.GetContext().Partners
                    .Any(d => d.EmailPartner == LoginBox.Text &&
                    d.Password == PasswordTextBox.Password))
                {
                    var user = Data.ProductsTrainingEntities.GetContext().Partners.Where(d => d.EmailPartner ==
                    LoginBox.Text &&
                    d.Password == PasswordTextBox.Password).FirstOrDefault();

                    Classes.Manager.MainFrame.Navigate(new Pages.ListViewPage());
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
