import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importa el paquete para lanzar URLs

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButtonWithText(
              icon: Icons.apps,
              label: 'Aplicación 1',
              onPressed: () {
                _launchURL('https://tageo.maps.arcgis.com/apps/instant/slider/index.html?appid=8c8bb3b4c62b4707b93f64cd40bfb3dd'); // URL para Aplicación 1
              },
            ),
            IconButtonWithText(
              icon: Icons.apps,
              label: 'Aplicación 2',
              onPressed: () {
                _launchURL('https://url-aplicacion-2.com'); // URL para Aplicación 2
              },
            ),
            IconButtonWithText(
              icon: Icons.apps,
              label: 'Aplicación 3',
              onPressed: () {
                _launchURL('https://url-aplicacion-3.com'); // URL para Aplicación 3
              },
            ),
          ],
        ),
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
