import 'package:flutter/material.dart';
import 'package:my_first_hellow_world/src/models/carritoCompras.dart';

class CarritoScreen extends StatelessWidget {
  CarritoScreen({super.key});
  final List<Productos> producto = [
    Productos(
        producto: 'Sabritas',
        stock: '5',
        foto:
            'https://img1.freepng.es/20180526/yl/kisspng-cheetos-potato-chip-cheese-flavor-corn-chip-5b09a2179d62c3.1936975015273579756447.jpg'),
    Productos(
        producto: 'Coca cola',
        stock: '2',
        foto:
            'https://logodownload.org/wp-content/uploads/2014/04/coca-cola-logo-0.png'),
    Productos(
        producto: 'Chicles',
        stock: '0',
        foto:
            'https://img1.freepng.es/20180402/pbw/kisspng-ice-cream-chewing-gum-bubbaloo-computer-icons-gum-5ac1e6fe5f1665.4472099015226570223895.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    //Retorna las pantallas
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Carrito'),
      ),
      body: ListView.builder(
        itemCount: producto.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor:
                producto[index].stock == '0' ? Colors.grey : Colors.white,
            leading: CircleAvatar(
                backgroundImage: NetworkImage(producto[index].foto)),
            title: Text('Producto: ${producto[index].producto}'),
            subtitle: Text(
              'Stock: ${producto[index].stock}',
              style: TextStyle(
                  color: producto[index].stock == '0'
                      ? Colors.blue
                      : Colors.black),
            ),
            trailing: const Icon(Icons.arrow_right),
          );
        },
      ),
    );
  }
}
