using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace DailyAssignment
{
    internal class CustomerValidation
    {
        public static bool ValidateEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email)) 
                return false;

            string emailPattern = @"^[^@\s]+@[^@\s]+\.(com|net|org|gov|in)$"; ;
            return Regex.IsMatch(email, emailPattern);
        }
        public static bool ValidatePhoneNumber(string phoneNumber)
        {
            if (string.IsNullOrWhiteSpace(phoneNumber)) 
                return false;

            string phonePattern = @"^\d{10}$";  
            return Regex.IsMatch(phoneNumber, phonePattern);
        }
        public static bool ValidateDateOfBirth(DateTime dateOfBirth)
        {
            DateTime today = DateTime.Today;
            int age = today.Year - dateOfBirth.Year;

            if (dateOfBirth > today.AddYears(-age)) age--;
            return age >= 0 && age <= 110;
        }
    }
}
