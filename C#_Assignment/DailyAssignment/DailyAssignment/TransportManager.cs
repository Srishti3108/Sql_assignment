using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DailyAssignment
{
    internal class TransportManager
    {
        public List<TransportSchedule> Schedules { get; set; } = new List<TransportSchedule>();
        public IEnumerable<TransportSchedule> Search(string transportType = null, string route = null, DateTime? departureTime = null)
        {
            return from schedule in Schedules
                   where (transportType == null || schedule.TransportType.Equals(transportType, StringComparison.OrdinalIgnoreCase)) &&
                         (route == null || schedule.Route.Equals(route, StringComparison.OrdinalIgnoreCase)) &&
                         (departureTime == null || schedule.DepartureTime == departureTime)
                   select schedule;
        }
        public IEnumerable<IGrouping<string, TransportSchedule>> GroupByTransportType()
        {
            return from schedule in Schedules
                   group schedule by schedule.TransportType into transportGroup
                   select transportGroup;
        }
        public IEnumerable<TransportSchedule> OrderBy(string orderByField)
        {
            return orderByField.ToLower() switch
            {
                "departuretime" => from schedule in Schedules orderby schedule.DepartureTime select schedule,
                "price" => from schedule in Schedules orderby schedule.Price select schedule,
                "seatsavailable" => from schedule in Schedules orderby schedule.SeatsAvailable select schedule,
                _ => Schedules  
            };
        }

        public IEnumerable<TransportSchedule> Filter(int minSeatsAvailable = 1, DateTime? startTime = null, DateTime? endTime = null)
        {
            return from schedule in Schedules
                   where schedule.SeatsAvailable >= minSeatsAvailable &&
                         (startTime == null || schedule.DepartureTime >= startTime) &&
                         (endTime == null || schedule.DepartureTime <= endTime)
                   select schedule;
        }
        public (int totalSeatsAvailable, decimal averagePrice) CalculateAggregates()
        {
            int totalSeats = Schedules.Sum(schedule => schedule.SeatsAvailable);
            decimal averagePrice = Schedules.Average(schedule => schedule.Price);
            return (totalSeats, averagePrice);
        }
        public IEnumerable<(string Route, DateTime DepartureTime)> SelectRoutesAndDepartureTimes()
        {
            return from schedule in Schedules
                   select (schedule.Route, schedule.DepartureTime);
        }


    }
}
