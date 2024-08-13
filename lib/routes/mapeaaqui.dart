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
          // Espacio superior para empujar el contenido hacia abajo
          Spacer(), // Empuja el contenido hacia abajo
          // Fila de imágenes centrada
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Imagen a la izquierda
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Espacio horizontal alrededor de cada imagen
                child: Image.asset(
                  'assets/img/mapasatelital.jpg', // Reemplaza con la URL de tu imagen
                  width: 280,
                  height: 250,
                ),
              ),
            ],
          ),
          SizedBox(height: 32.0), // Espacio entre las imágenes y el contenido
          // Cuadro de texto con fondo colorido
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent, // Cambia el color del fondo aquí
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              'Mediante el uso de "ArcGis Survey123" puedes colaborar con datos para seguir expandiendo la información sobre las catastrofes naturales',
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16.0), // Espacio entre el texto y el botón
          // Botón que redirige a un enlace
          ElevatedButton(
            onPressed: () => _launchURL('https://www.pluriversosclimaticos.cl'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // Cambia el color del botón aquí
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            ),
            child: Text('Ir al enlace'),
          ),
          SizedBox(height: 32.0), // Espacio adicional en la parte inferior
        ],
      ),
    );
  }
}






 //'Mediante el uso de "ArcGis Survey123" puedes colaborar con datos para seguir expandiendo la información sobre las catastrofes naturales ',
