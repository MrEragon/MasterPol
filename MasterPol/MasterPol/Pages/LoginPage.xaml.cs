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

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder er = new StringBuilder();
                if (String.IsNullOrEmpty(LoginBox.Text))
                    {
                    er.AppendLine("Введите логин");
                }
                if (String.IsNullOrEmpty(PasswordTextBox.Password))
                {
                    er.AppendLine("Введите пароль");
                }
                if (er.Length > 0)
                {
                    MessageBox.Show(er.ToString(),"Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                if (Data.ProductsTrainingEntities.GetContext().Partners.Any(d => d.EmailPartner == LoginBox.Text && d.Password == PasswordTextBox.Password))
                {
                    var user = Data.ProductsTrainingEntities.GetContext().Partners.Where(d => d.EmailPartner == LoginBox.Text && d.Password == PasswordTextBox.Password);
                    Classes.Manager.MainFrame.Navigate(new Pages.ListViewPage());
                }
            }
            catch { }
        }
    }
}
