import 'package:flutter/material.dart';
import 'package:my_first_hellow_world/src/models/persona.dart';

class ContactosScreen extends StatelessWidget {
  ContactosScreen({super.key});
  final List<Persona> contactos = [
    Persona(nombre: 'Paquito', foto: '', apepat: 'Martinez'),
    Persona(nombre: 'Monse', foto: '', apepat: 'Tejeda'),
    Persona(nombre: 'Hugo', foto: '', apepat: 'Hernandez')
  ];
  @override
  Widget build(BuildContext context) {
    //Retorna las pantallas
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de contactos'),
      ),
      body: ListView.builder(
        itemCount: contactos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3FRfOIVKfKXjwEdE_XaxHsqnZcoJMWrDdew&usqp=CAU')),
            title: Text(contactos[index].nombre),
            subtitle: Text(contactos[index].apepat),
            trailing: const Icon(Icons.arrow_right),
          );
        },
      ),
    );
  }
}
