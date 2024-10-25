using System.Text.Json;
using System.Xml.Serialization;
using System.Linq;

namespace DailyAssignment
{
    internal class Program
    {
        static void Main(string[] args)
        {

            #region//----Assignment 11-------------
            /*var authors = new List<Author>
            {
                new Author { AuthorId = 1, Name = "TulsiDas", Nationality = "Indian" },
                new Author { AuthorId = 2, Name = "James", Nationality = "British" },
                new Author { AuthorId = 3, Name = "RamDas", Nationality = "Indian" },
                new Author { AuthorId = 4, Name = "Ruchi", Nationality = "American" },
                new Author { AuthorId = 5, Name = "Scott", Nationality = "American" }
            };
            var books = new List<Book>
            {
            new Book { BookId = 1, Title = "Hanuman Chalisha", Author = authors[0] },
            new Book { BookId = 2, Title = "1984", Author = authors[1] },
            new Book { BookId = 3, Title = "Awadhi", Author = authors[2] },
            new Book { BookId = 4, Title = "To Kill a Mockingbird", Author = authors[3] },
            new Book { BookId = 5, Title = "The Great Gatsby", Author = authors[4] }

            };
            string authorJsonPath = "C:\\Users\\Srishti Seth\\Documents\\C# project\\authors.json";
            string bookJsonPath = "C:\\Users\\Srishti Seth\\Documents\\C# project\\books.json";
            File.WriteAllText(authorJsonPath, JsonSerializer.Serialize(authors, new JsonSerializerOptions { WriteIndented = true }));
            File.WriteAllText(bookJsonPath, JsonSerializer.Serialize(books, new JsonSerializerOptions { WriteIndented = true }));

            SaveToXml("authors.xml", authors);
            SaveToXml("books.xml", books);
            Console.WriteLine("Reading JSON data:");
            var authorsFromJson = JsonSerializer.Deserialize<List<Author>>(File.ReadAllText(authorJsonPath));
            var booksFromJson = JsonSerializer.Deserialize<List<Book>>(File.ReadAllText(bookJsonPath));
            Console.WriteLine("\nAuthors JSON:");
            foreach (var author in authorsFromJson)
            {
                Console.WriteLine($"Author ID: {author.AuthorId}, Name: {author.Name}, Nationality: {author.Nationality}");
            }

            Console.WriteLine("\nBooks JSON:");
            foreach (var book in booksFromJson)
            {
                Console.WriteLine($"Book ID: {book.BookId}, Title: {book.Title}, Author: {book.Author.Name}");
            }
            static void SaveToXml<Author>(string filePath, List<Author> authors )
            {
                XmlSerializer serializer = new XmlSerializer(typeof(Author));
                using (FileStream stream = new FileStream(filePath, FileMode.Create))
                {
                    serializer.Serialize(stream, authors);
                }
            }
            static string LoadFromXml<Book>(string filePath)
            {
                XmlSerializer serializer = new XmlSerializer(typeof(Book));
                using (FileStream stream = new FileStream(filePath, FileMode.Open))
                {
                    return (string)serializer.Deserialize(stream);
                }
            }*/
            #endregion
            //-------Assignment 12---------------


            Customer customer = new Customer
            {
                Name = "Srishti",
                Email = "Srisht@mac.com",
                PhoneNumber = "1234567890",
                DateOfBirth = new DateTime(2002, 5, 21)
            };


            bool isEmailValid = CustomerValidation.ValidateEmail(customer.Email);
            bool isPhoneValid = CustomerValidation.ValidatePhoneNumber(customer.PhoneNumber);
            bool isDobValid = CustomerValidation.ValidateDateOfBirth(customer.DateOfBirth);

            Console.WriteLine($"Email valid: {isEmailValid}");
            Console.WriteLine($"Phone number valid: {isPhoneValid}");
            Console.WriteLine($"Date of birth valid: {isDobValid}");

            //----------ASSIGNMENT 14---------------

            /*var manager = new TransportManager();
            manager.Schedules.AddRange(new List<TransportSchedule>
            {
                new TransportSchedule { TransportType = "Bus", Route = "Route A", DepartureTime = DateTime.Now.AddHours(2), ArrivalTime = DateTime.Now.AddHours(4), Price = 25.5m, SeatsAvailable = 30 },
                new TransportSchedule { TransportType = "Flight", Route = "Route B", DepartureTime = DateTime.Now.AddHours(3), ArrivalTime = DateTime.Now.AddHours(5), Price = 150.0m, SeatsAvailable = 120 },
                new TransportSchedule { TransportType = "Bus", Route = "Route C", DepartureTime = DateTime.Now.AddHours(1), ArrivalTime = DateTime.Now.AddHours(3), Price = 20.0m, SeatsAvailable = 15 },
                new TransportSchedule { TransportType = "Flight", Route = "Route A", DepartureTime = DateTime.Now.AddHours(4), ArrivalTime = DateTime.Now.AddHours(6), Price = 200.0m, SeatsAvailable = 50 },
                new TransportSchedule { TransportType = "Bus", Route = "Route B", DepartureTime = DateTime.Now.AddHours(5), ArrivalTime = DateTime.Now.AddHours(7), Price = 30.0m, SeatsAvailable = 25 }
            });

            
            var flights = manager.Search(transportType: "Flight");
            Console.WriteLine("Flights:");
            foreach (var flight in flights)
            {
                Console.WriteLine($"{flight.TransportType} - {flight.Route} - {flight.DepartureTime}");
            }

            
            var groupedByType = manager.GroupByTransportType();
            Console.WriteLine("\nGrouped by Transport Type:");
            foreach (var group in groupedByType)
            {
                Console.WriteLine($"Transport Type: {group.Key}");
                foreach (var schedule in group)
                {
                    Console.WriteLine($"  Route: {schedule.Route}, Departure: {schedule.DepartureTime}");
                }
            }

            
            var orderedByPrice = manager.OrderBy("price");
            Console.WriteLine("\nOrdered by Price:");
            foreach (var schedule in orderedByPrice)
            {
                Console.WriteLine($"{schedule.Route} - Price: {schedule.Price}");
            }

           
            var filteredSchedules = manager.Filter(minSeatsAvailable: 20, startTime: DateTime.Now, endTime: DateTime.Now.AddHours(6));
            Console.WriteLine("\nFiltered by Seat Availability and Time Range:");
            foreach (var schedule in filteredSchedules)
            {
                Console.WriteLine($"{schedule.TransportType} - {schedule.Route} - Seats Available: {schedule.SeatsAvailable} - Departure: {schedule.DepartureTime}");
            }

            
            var aggregates = manager.CalculateAggregates();
            Console.WriteLine($"\nTotal Seats Available: {aggregates.totalSeatsAvailable}, Average Price: {aggregates.averagePrice}");

            
            var routesAndTimes = manager.SelectRoutesAndDepartureTimes();
            Console.WriteLine("\nRoutes and Departure Times:");
            foreach (var (route, departureTime) in routesAndTimes)
            {
                Console.WriteLine($"Route: {route}, Departure Time: {departureTime}");
            }*/
        }
    }
}
