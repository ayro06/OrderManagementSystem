using OMS.Domain;
using OMS.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            var repo = new StockRepository();
            
            var items = repo.GetStockItems();
            foreach (StockItem i in items)
            {
                Console.WriteLine($"{i.Id} {i.Name} {i.Price} {i.InStock}");
            }
            
            var table = repo.GetStockItem(1);
            Console.WriteLine($"{table.Id} {table.Name} {table.Price} {table.InStock}");
            var chair = repo.GetStockItem(2);
            Console.WriteLine($"{chair.Id} {chair.Name} {chair.Price} {chair.InStock}");

            var order = new OrderHeader(1, DateTime.Now, 1);
            order.AddOrUpdateOrderItem(table.Id, table.Price, table.Name, 1);
            order.AddOrUpdateOrderItem(chair.Id, chair.Price, chair.Name, 1);
            order.AddOrUpdateOrderItem(table.Id, table.Price, table.Name, 1);

            Console.ReadKey();
        }
    }
}
