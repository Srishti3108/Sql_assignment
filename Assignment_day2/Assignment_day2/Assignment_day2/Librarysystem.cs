using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_day2
{
    internal class Librarysystem
    {
        public void PerformBorrowing(IBorrowable user,string booktile )
        {
            user.BorrowBook(booktile);
        }
        public void PerformReservation(IReservable user,string booktile )
        {
            user.ReserveBook(booktile);
        }
        public void ManageInventory(IIventoryManager manager, string booktitle,bool isAdding)
        {
            if(isAdding)
            {
                manager.AddBook(booktitle);
            }
             else 
                manager.RemoveBook(booktitle);
        }
    }
}
