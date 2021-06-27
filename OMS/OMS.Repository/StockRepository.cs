using OMS.Domain;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OMS.Repository
{
    public class StockRepository
    {
        string _cs = @"Data Source = localhost\SQLEXPRESS; Initial Catalog = OrderManagementDb; Integrated Security = true";
        public IEnumerable<StockItem> GetStockItems()
        {
            var items = new List<StockItem>();
            using (var con = new SqlConnection(_cs))
            using (var cmd = new SqlCommand("sp_SelectStockItems", con))
            {
                con.Open();
                var rdr = cmd.ExecuteReader();

                var columns = new List<string>();
                for (int i = 0; i < rdr.FieldCount; i++)
                {
                    columns.Add(rdr.GetName(i));
                }

                //Console.WriteLine($"{columns[0]}\t {columns[1]}\t {columns[2]}\t {columns[3]}");

                while (rdr.Read())
                {
                    int id = rdr.GetInt32(0);
                    string name = rdr.GetString(1);
                    decimal price = rdr.GetDecimal(2);
                    int instock = rdr.GetInt32(3);
                    var item = new StockItem(id, name, price, instock);
                    items.Add(item);
                    //Console.WriteLine($"{id}\t {name}\t {price}\t {instock}");
                }
            }

            return items;
        }

        public StockItem GetStockItem(int id) 
        {
            StockItem item = null;

            using (var con = new SqlConnection(_cs))
            using (var cmd = new SqlCommand("sp_SelectStockItemById @id", con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                var rdr = cmd.ExecuteReader(System.Data.CommandBehavior.SingleRow);
                rdr.Read();

                string name = rdr.GetString(1);
                decimal price = rdr.GetDecimal(2);
                int instock = rdr.GetInt32(3);
                item = new StockItem(id, name, price, instock);
                Console.WriteLine($"{item.ToString()}");
            }

            return item;
        }
    }
}
