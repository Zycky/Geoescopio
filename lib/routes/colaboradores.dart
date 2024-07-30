import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


// Modelo de datos para un colaborador
class Colaborador {
  final String nombre;
  final String descripcion;
  final String imagenPath;
  final List<String> enlaces; // Nuevo parámetro

  Colaborador({
    required this.nombre,
    required this.descripcion,
    required this.imagenPath,
    required this.enlaces, // Inicialización del nuevo parámetro
  });
}

// Página principal que muestra la lista de colaboradores
class ColaboradoresPage extends StatelessWidget {
  // Lista de colaboradores
  final List<Colaborador> colaboradores = [
    Colaborador(
      nombre: 'Pablo Mansilla Quiñones',
      descripcion: 'Jefe del Proyecto',
      imagenPath: 'assets/img/pablo.jpg',
      enlaces: ['https://www.researchgate.net/profile/Pablo-Mansilla-Quinones'],
    ),
    Colaborador(
      nombre: 'Colaborador 2',
      descripcion: 'Descripción del colaborador 2',
      imagenPath: 'assets/images/image2.png',
      enlaces: ['https://example.com/3'],
    ),
    // Agrega más colaboradores aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colaboradores'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: colaboradores.length,
        itemBuilder: (context, index) {
          final colaborador = colaboradores[index];
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
                backgroundImage: AssetImage(colaborador.imagenPath),
                radius: 30.0,
              ),
              title: Text(
                colaborador.nombre,
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              subtitle: Text(
                colaborador.descripcion,
                style: TextStyle(color: Colors.black54, fontSize: 14.0),
              ),
              onTap: () {
                // Mostrar el diálogo con los detalles del colaborador
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(colaborador.nombre),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundImage: AssetImage(colaborador.imagenPath),
                              radius: 50.0,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            colaborador.nombre,
                            style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.black),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            colaborador.descripcion,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black87),
                          ),
                          SizedBox(height: 16.0),
                          // Mostrar enlaces si existen
                          if (colaborador.enlaces.isNotEmpty) ...[
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
                              children: colaborador.enlaces.map((enlace) {
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

