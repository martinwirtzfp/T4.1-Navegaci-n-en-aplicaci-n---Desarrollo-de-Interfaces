import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_4_1_interfaces/viewmodels/ordersViewModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pedidos del Bar'),
      ),
      body: Consumer<OrderViewModel>(
        // ⭐ Consumer "escucha" cambios en OrderViewModel
        // Cuando el ViewModel llama notifyListeners(), esto se reconstruye
        builder: (context, viewModel, child) {
          // Aquí tenemos acceso al viewModel y sus datos
          
          // Si no hay pedidos, mostrar mensaje
          if (viewModel.orders.isEmpty) {
            return const Center(
              child: Text(
                'No hay pedidos',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          // Si hay pedidos, mostrar lista
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: viewModel.orders.length,
            itemBuilder: (context, index) {
              // Obtener cada pedido
              final order = viewModel.orders[index];
              
              // Crear una tarjeta por cada pedido
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  // Círculo con número de mesa
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      '${order.table}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Título: Mesa X
                  title: Text(
                    'Mesa ${order.table}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Subtítulo: productos y total
                  subtitle: Text(
                    'Productos: ${order.totalItems} - Total: ${order.total.toStringAsFixed(2)}€',
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // TODO: Al pulsar, ir a detalle del pedido
                    print('Pulsado pedido mesa ${order.table}');
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Crear nuevo pedido
          print('Crear nuevo pedido');
        },
        tooltip: 'Nuevo Pedido',
        child: const Icon(Icons.add),
      ),
    );
  }
}
