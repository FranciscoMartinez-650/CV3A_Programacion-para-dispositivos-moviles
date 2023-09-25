import 'package:flutter/material.dart';
import 'package:my_first_hellow_world/src/practica2309/ejemploFuture.dart';
import 'package:my_first_hellow_world/src/screens/carrito_screen.dart';
//import 'package:my_first_hellow_world/src/screens/contacto_screen.dart';
import 'package:restart_app/restart_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),
      //home: CarritoScreen(),
      //home: const Contador(),
      home: EjemploFuture(),
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Hola mundo', style: TextStyle(color: Colors.red)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
          title: const Text('Primer Ejercicio', textAlign: TextAlign.center)),
    );
  }
}

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int cont = 1;
  Color iconColor = Colors.yellow;
  String mensaje = 'Primer Ejercicio';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mensaje)),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Estancia',
            style: TextStyle(fontSize: 25, color: Colors.blue),
          ),
          Text(
            cont.toString(),
            style: const TextStyle(fontSize: 30, color: Colors.blue),
          ),
          Icon(
            Icons.lightbulb,
            color: iconColor,
            size: 50,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (iconColor == Colors.yellow) {
              iconColor = Colors.grey;
              cont++;
            } else {
              iconColor = Colors.yellow;
            }
            if (cont == 5) {
              iconColor = Colors.red;
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Ya fue tu foco'),
                    content: const Text(
                        'Por tanto prender y apagar tu foco ya esta bien fundido'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('reparar foco'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Restart.restartApp();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
