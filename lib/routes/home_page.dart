import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importa el paquete para lanzar URLs

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      imagePath: 'assets/img/background.jpg', // Ruta a tu imagen de fondo
      child: Scaffold(
        appBar: AppBar(
          title: Text('Inicio'),
        ),
        backgroundColor: Colors.transparent, // Asegúrate de que el fondo del Scaffold sea transparente
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen centrada en la parte superior
            Container(
              margin: EdgeInsets.only(top: 20), // Margen superior para la imagen
              child: Image.asset(
                'assets/img/eye1.png', // Ruta a la imagen en la parte superior
                width: 200, // Ajusta el tamaño de la imagen
                height: 200, // Ajusta el tamaño de la imagen
              ),
            ),
            Expanded(
              child: Center(
                child: Wrap(
                  spacing: 20, // Espacio horizontal entre los elementos
                  runSpacing: 20, // Espacio vertical entre las filas de elementos
                  alignment: WrapAlignment.center, // Alineación horizontal
                  children: [
                    _buildIconButtonContainer(
                      icon: Icons.apps,
                      label: 'Memorias Climáticas',
                      color: Colors.blueAccent, // Color de fondo del contenedor
                      onPressed: () {
                        _launchURL('https://tageo.maps.arcgis.com/apps/instant/slider/index.html?appid=8c8bb3b4c62b4707b93f64cd40bfb3dd'); // URL para Aplicación 1
                      },
                    ),
                    _buildIconButtonContainer(
                      icon: Icons.apps,
                      label: 'Presentes Climáticos',
                      color: Colors.greenAccent, // Color de fondo del contenedor
                      onPressed: () {
                        _launchURL('https://url-aplicacion-2.com'); // URL para Aplicación 2
                      }, 
                    ),
                    _buildIconButtonContainer(
                      icon: Icons.apps,
                      label: 'Futuros Climáticos',
                      color: Colors.redAccent, // Color de fondo del contenedor
                      onPressed: () {
                        _launchURL('https://url-aplicacion-3.com'); // URL para Aplicación 3
                      }, 
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir un contenedor alrededor del IconButtonWithText
  Widget _buildIconButtonContainer({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: EdgeInsets.all(16), // Espaciado interno
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8), // Esquinas redondeadas
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8),
          IconButtonWithText(
            icon: icon,
            label: label,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  // Función para lanzar una URL en el navegador
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo lanzar $url';
    }
  }
}

// Widget personalizado para IconButton con texto debajo
class IconButtonWithText extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const IconButtonWithText({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
          iconSize: 64,
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

// Widget para agregar una imagen de fondo
class BackgroundImage extends StatelessWidget {
  final Widget child;
  final String imagePath;

  const BackgroundImage({
    super.key,
    required this.child,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
      ],
    );
  }
}
