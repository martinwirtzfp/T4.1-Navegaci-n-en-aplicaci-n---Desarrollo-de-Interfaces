import 'package:flutter/material.dart';
import 'package:tarea_4_1_interfaces/models/order.dart';
import 'package:tarea_4_1_interfaces/models/product.dart';

class Orderviewmodel extends ChangeNotifier {
  // Lista de privada de pedidos
  // Solo accesible desde este ViewModel
  final List<Order> orders = [];

  // Crear pedidos iniciales
  void loadInitialOrders() {
    orders.addAll([
      Order(1, {Product('Cerveza', 2.5): 2, Product('Tapa', 4.0): 2}),
      Order(2, {Product('Café', 1.5): 1}),
      Order(3, {Product('Refresco', 2.0): 3, Product('Bocadillo', 5.0): 2}),
    ]);
  }

  // Añadir un pedido
  void addOrder(Order order) {
    for (var o in orders) {
      if (o.table == order.table) {
        return;
      }
      orders.add(order);
      notifyListeners();
    }
  }

  // Eliminar un pedido
  void removeOrder(Order order) {
    orders.remove(order);
    notifyListeners();
  }

  // Añadir un producto a un pedido
  void addProductToOrder(int table, Product product, int quantity) {}

  // Eliminar un producto de un pedido
}
