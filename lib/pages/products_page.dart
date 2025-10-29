import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {'name': 'Laptop Lenovo', 'quantity': 5, 'price': 3500.0},
      {'name': 'Mouse Logitech', 'quantity': 12, 'price': 80.0},
      {'name': 'Teclado Mecánico', 'quantity': 7, 'price': 150.0},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Productos'),
        backgroundColor: const Color(0xFF0A2E5C),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Icon(Icons.inventory, color: Color(0xFF0A2E5C)),
              title: Text(
                product['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Cantidad: ${product['quantity']} • Precio: S/${product['price']}',
              ),
              onTap: () {
                // Al tocar un producto, mostramos un diálogo con más detalles
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(product['name']),
                    content: Text(
                        'Cantidad disponible: ${product['quantity']}\nPrecio: S/${product['price']}'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
