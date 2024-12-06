const orders = [
    { id: 1, userId: 101, product: 'Laptop', amount: 999, delivered: true },
    { id: 2, userId: 102, product: 'Phone', amount: 699, delivered: false },
    { id: 3, userId: 101, product: 'Tablet', amount: 499, delivered: true },
    { id: 4, userId: 103, product: 'Monitor', amount: 199, delivered: true },
    { id: 5, userId: 104, product: 'Keyboard', amount: 49, delivered: false },
    { id: 6, userId: 102, product: 'Mouse', amount: 25, delivered: true },
    { id: 7, userId: 105, product: 'Printer', amount: 150, delivered: true },
    { id: 8, userId: 106, product: 'Webcam', amount: 75, delivered: false },
    { id: 9, userId: 107, product: 'Speakers', amount: 85, delivered: true },
    { id: 10, userId: 108, product: 'Router', amount: 120, delivered: true },
  ];
  
  // 1. List only the orders that are delivered
  const deliveredOrdered = orders.filter(order => order.delivered);
  console.log( deliveredOrdered);
  
  // 2. Create an array of objects with only userId and amount from the delivered orders
  const userIdAndAmount = orders.map(order => ({
    userId: order.userId,
    amount: order.amount
  }));
  console.log( userIdAndAmount);
  
  // 3. Find the first order placed by the user with userId 102
  const firstOrderForUser102 = orders.find(order => order.userId === 102);
  console.log(firstOrderForUser102);
  
  // 4. Calculate the total revenue from delivered orders
  const totalRevenue = orders.reduce((accumalator, currentValue) => accumalator + currentValue.amount, 0);
  console.log( totalRevenue);
  