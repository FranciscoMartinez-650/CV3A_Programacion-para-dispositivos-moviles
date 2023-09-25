import 'dart:math';

import 'package:flutter/material.dart';

class EjemploFuture extends StatefulWidget {
  const EjemploFuture({super.key});

  @override
  State<EjemploFuture> createState() => _EjemploFutureState();
}

class _EjemploFutureState extends State<EjemploFuture> {
  late Future<int> numero;
  @override
  void initState() {
    super.initState();
    numero = obtenerNumero();
  }

  // Declaración de la variable que contendrá el futuro
  Future<int> obtenerNumero() {
    return Future.delayed(const Duration(seconds: 2), () {
      return Random().nextInt(10);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color iconColor = Colors.yellow;
    Random random = Random();
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: obtenerNumero(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  int data = snapshot.data!;
                  return Text(
                    data.toString(),
                    style: TextStyle(
                      color: iconColor = Color.fromRGBO(
                        random.nextInt(256), // Valor de rojo aleatorio
                        random.nextInt(256), // Valor de verde aleatorio
                        random.nextInt(256), // Valor de azul aleatorio
                        1.0, // Opacidad (en este caso, 1 significa completamente opaco)
                      ),
                      fontSize: 70,
                    ),
                  );
                } else {
                  return const Text('No hay datos');
                }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numero = obtenerNumero();
          });
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
