using static Assignment_day2.Student;

namespace Assignment_day2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Librarysystem librarysystem=new Librarysystem();
            Student student=new Student();
            Teacher teacher = new Teacher();
            Librarian librarian=new Librarian();
            librarysystem.PerformBorrowing(student, "1984");
            librarysystem.PerformBorrowing( teacher,"Workspace");
            librarysystem.PerformReservation(teacher, "Encyclopedia");
            librarysystem.ManageInventory(librarian, "Geography",true);
            librarysystem.ManageInventory(librarian, "Civics",false);
            Console.ReadLine();
        }
    }
}
