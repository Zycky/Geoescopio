import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Asegúrate de agregar esta dependencia en pubspec.yaml

class MapeaaquiPage extends StatelessWidget {

  // Método para abrir un enlace en el navegador
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapea aqui'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(), // Empuja el contenido hacia abajo

          // Fila de imágenes centrada
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Imagen que redirige al hacer clic
              GestureDetector(
                onTap: () => _launchURL('https://survey123.arcgis.com/share/9c416dad489b4bf5a5a2e73c62d6e0f1'), // URL que se abrirá al hacer clic
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // Espacio horizontal alrededor de la imagen
                  child: Image.asset(
                    'assets/img/iconomapa.png', // Reemplaza con la URL de tu imagen
                    width: 280,
                    height: 250,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 32.0), // Espacio entre la imagen y el texto

          // Cuadro de texto con fondo colorido
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(75, 0, 0, 0), // Cambia el color del fondo aquí
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Únete al mapeo colaborativo de Pluriversos Climáticos. Comparte tus perspectivas y experiencias para explorar juntos territorios alternativos frente al cambio climático. ¡Participa y construyamos futuros posibles!',
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          

          SizedBox(height: 40.0), // Espacio adicional en la parte inferior
        ],
      ),
    );
  }
}
