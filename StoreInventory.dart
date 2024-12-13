// Product Class
class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);

  // Method to restock a product
  void restock(int amount) {
    quantity += amount;
    print('Restocked $name by $amount. New quantity: $quantity');
  }

  // Method to sell a product
  void sell(int amount) {
    if (quantity >= amount) {
      quantity -= amount;
      print('Sold $amount of $name. Remaining quantity: $quantity');
    } else {
      print('Sorry, $name Not enough in stock to sell $amount.');
    }
  }

  @override
  String toString() {
    return 'Product: $name, Price: \$${price.toStringAsFixed(2)}, Quantity: $quantity';
  }
}

// Store Class
class Store {
  String name;
  List<Product> inventory = [];

  Store(this.name);

  // Add a product to the inventory
  void addProduct(Product p) {
    inventory.add(p);
    print('Added ${p.name} to $name inventory.');
  }

  // Remove a product by name
  void removeProduct(String productName) {
    inventory.removeWhere((product) => product.name == productName);
    print('Removed $productName from $name inventory.');
  }

  // Print all products in the inventory
  void printInventory() {
    print('\n$name Inventory:');
    if (inventory.isEmpty) {
      print('No products in inventory.');
    } else {
      for (var product in inventory) {
        print(product);
      }
    }
  }
}

// Main function
void main() {
  // Create a Store object
  Store myStore = Store('Tech Depot');

  // Create Product objects
  Product laptop = Product('Laptop', 999.99, 10);
  Product tablet = Product('Tablet', 499.99, 5);

  // Add products to the store
  myStore.addProduct(laptop);
  myStore.addProduct(tablet);


  laptop.sell(2); // Selling 2 laptops
 
  // Remove a product
  myStore.removeProduct('Tablet');

  // Print the inventory
  myStore.printInventory();
}
