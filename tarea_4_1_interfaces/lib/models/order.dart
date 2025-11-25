import 'package:tarea_4_1_interfaces/models/product.dart';

class Order {
  int table;
  double total = 0.0;
  List<Product> products;

  Order(this.table, this.products);

  void addProduct(Product product) {
    products.add(product);
    total+=product.price;
  }
  void deleteProduct(Product product) {
    products.remove(product);
    total-= product.price;
  }
}