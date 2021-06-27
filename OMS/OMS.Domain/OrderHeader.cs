using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OMS.Domain
{
    public class OrderHeader
    {
        public OrderHeader(int id, DateTime dateTime, int stateId)
        {
            Id = id;
            DateTime = dateTime;
        }

        public int Id { get; private set; }
        public DateTime DateTime { get; private set; }

        public List<OrderItem> OrderItems { get; } = new List<OrderItem>();

        public OrderItem AddOrUpdateOrderItem(int stockItemId, decimal price, string description, int quantity)
        {
            var item = OrderItems.FirstOrDefault(i => i.StockItemId == stockItemId);
            if (item != null)
            {
                item.Quantity += quantity;
            }
            else
            {
                item = new OrderItem(this, stockItemId, price, description, quantity);
                OrderItems.Add(item);
            }

            return item;
        }
    }
}
