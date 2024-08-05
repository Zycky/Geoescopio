import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Modelo de datos para un Realizadores
class Realizadores {
  final String nombre;
  final String descripcion;
  final String imagenPath;
  final List<String> enlaces; // Nuevo parámetro

  Realizadores({
    required this.nombre,
    required this.descripcion,
    required this.imagenPath,
    required this.enlaces, // Inicialización del nuevo parámetro
  });
}

// Página principal que muestra la lista de Realizadoreses
class RealizadoresPage extends StatelessWidget {
  // Lista de Realizadoreses
  final List<Realizadores> realizadores = [
    Realizadores(
      nombre: 'Pablo Mansilla Quiñones',
      descripcion: 'Jefe del Proyecto',
      imagenPath: 'assets/img/pablo.jpg',
      enlaces: ['https://www.researchgate.net/profile/Pablo-Mansilla-Quinones'],
    ),
    Realizadores(
      nombre: 'Maximiliano Valdebenito Segura',
      descripcion: 'Desarrollador de aplicaciones usadas en Geoescopio',
      imagenPath: 'assets/images/image2.png',
      enlaces: ['https://github.com/Zycky'],
    ),
    Realizadores(
      nombre: 'Matias Basáez Peralta',
      descripcion: 'Desarrollador de aplicaciones usadas en Geoescopio',
      imagenPath: 'assets/images/image2.png',
      enlaces: ['https://github.com/Smooth2044'],
    ),
    // Realizadores(
    //   nombre: '...Nombre...',
    //   descripcion: '...Descripcion...',
    //   imagenPath: '...Ruta de imagen...',
    //   enlaces: ['...Enlaces...'],
    // ),
    // Agrega más Realizadoreses aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realizadores'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: realizadores.length,
        itemBuilder: (context, index) {
          final Realizadores = realizadores[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(Realizadores.imagenPath),
                radius: 30.0,
              ),
              title: Text(
                Realizadores.nombre,
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              subtitle: Text(
                Realizadores.descripcion,
                style: TextStyle(color: Colors.black54, fontSize: 14.0),
              ),
              onTap: () {
                // Mostrar el diálogo con los detalles del Realizadores
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(Realizadores.nombre),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundImage: AssetImage(Realizadores.imagenPath),
                              radius: 50.0,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            Realizadores.nombre,
                            style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: const Color.fromARGB(106, 0, 0, 0)),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            Realizadores.descripcion,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black87),
                          ),
                          SizedBox(height: 16.0),
                          // Mostrar enlaces si existen
                          if (Realizadores.enlaces.isNotEmpty) ...[
                            Text(
                              'Enlaces:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: Realizadores.enlaces.map((enlace) {
                                return GestureDetector(
                                  onTap: () {
                                    // Abrir el enlace en el navegador
                                    _launchURL(enlace);
                                  },
                                  child: Text(
                                    enlace,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Cierra el diálogo
                          },
                          child: Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  // Función para abrir enlaces en el navegador
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }
}

