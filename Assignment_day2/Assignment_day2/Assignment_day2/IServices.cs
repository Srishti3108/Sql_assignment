using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Assignment_day2
{
    internal interface IServices
    {

    }
    public interface IBorrowable
    {
        void BorrowBook(string booktitle);
    }
    public interface IReservable
    {
        void ReserveBook(string booktitle);
    }
    public interface IIventoryManager
    {
        void AddBook(string booktitle);
        void RemoveBook(string booktitle);
    }
    public class Student : IBorrowable
    {
        public void BorrowBook(String booktitle)
        {
            Console.WriteLine($"Student borrowed the book:{booktitle}");
        }
        public class Teacher : IBorrowable, IReservable
        {
            public void BorrowBook(string booktitle)
            {
                Console.WriteLine($"Teacher borrowed the book:{booktitle}");
            }
            public void ReserveBook(String booktitle)
            {
                Console.WriteLine($"Teacher reserved the book:{booktitle}");
            }
        }
        public class Librarian : IIventoryManager
        {
            public void AddBook(string booktitle)
            {
                Console.WriteLine($"Librarian added the book:{booktitle}");
            }
            public void RemoveBook(String booktitle)
            {
                Console.WriteLine($"Librarian removed the book:{booktitle}");
            }
        }

    }

}
