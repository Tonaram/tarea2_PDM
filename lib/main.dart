import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Iteso',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int likeCount = 0;
  Color correoButtonColor = Colors.black;
  Color llamadaButtonColor = Colors.black;
  Color rutaButtonColor = Colors.black;

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void toggleButtonColor(ButtonType type) {
    setState(() {
      switch (type) {
        case ButtonType.Correo:
          correoButtonColor =
              correoButtonColor == Colors.black ? Colors.indigo : Colors.black;
          break;
        case ButtonType.Llamada:
          llamadaButtonColor =
              llamadaButtonColor == Colors.black ? Colors.indigo : Colors.black;
          break;
        case ButtonType.Ruta:
          rutaButtonColor =
              rutaButtonColor == Colors.black ? Colors.indigo : Colors.black;
          break;
      }
    });
  }

  void incrementLikeCount() {
    setState(() {
      likeCount++;
    });
  }

  void decrementLikeCount() {
    setState(() {
      likeCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Iteso'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                  "https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg"),
              ListTile(
                title: const Text(
                  "El ITESO, Universidad Jesuita de Guadalajara",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "San Pedro Tlaquepaque, Jal",
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: incrementLikeCount,
                      icon: const Icon(Icons.thumb_up),
                    ),
                    Text(likeCount.toString()),
                    IconButton(
                      onPressed: decrementLikeCount,
                      icon: const Icon(Icons.thumb_down),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        iconSize: 48,
                        onPressed: () {
                          showSnackBar("ejemplo@iteso.mx");
                          toggleButtonColor(ButtonType.Correo);
                        },
                        icon: Icon(Icons.mail, color: correoButtonColor),
                      ),
                      const Text("Correo"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        iconSize: 48,
                        onPressed: () {
                          showSnackBar("+52 33 3669 3434");
                          toggleButtonColor(ButtonType.Llamada);
                        },
                        icon: Icon(Icons.phone, color: llamadaButtonColor),
                      ),
                      const Text("Llamada"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        iconSize: 48,
                        onPressed: () {
                          showSnackBar("Anillo Perif. Sur Manuel Gómez Morín 8585, Santa María Tequepexpan, 45604.");
                          toggleButtonColor(ButtonType.Ruta);
                        },
                        icon: Icon(Icons.directions, color: rutaButtonColor),
                      ),
                      const Text("Ruta"),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              const Text(
                '''El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente) es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.

La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara''',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum ButtonType { Correo, Llamada, Ruta }