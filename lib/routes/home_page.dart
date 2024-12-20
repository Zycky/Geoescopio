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
                'assets/img/ojoreal.png', // Ruta a la imagen en la parte superior
                width: 250, // Ajusta el tamaño de la imagen
                height: 250, // Ajusta el tamaño de la imagen
              ),
            ),
            Expanded(
              child: Center(
                child: Wrap(
                  spacing: 20, // Espacio horizontal entre los elementos
                  runSpacing: 10, // Espacio vertical entre las filas de elementos
                  alignment: WrapAlignment.center, // Alineación horizontal
                  children: [
                    _buildImageButton(
                      imagePath: 'assets/img/memorias-climaticas.png', // Ruta a la imagen para Aplicación 1
                      label: 'Memorias\nClimáticas',
                      color: const Color.fromARGB(0, 68, 137, 255), // Color de fondo del contenedor
                      url: 'https://tageo.maps.arcgis.com/apps/mapviewer/index.html?webmap=71dba50fd7ec41fab04e941d23f45c32', // URL para Aplicación 1
                    ),
                    _buildImageButton(
                      imagePath: 'assets/img/presentes-climaticos.png', // Ruta a la imagen para Aplicación 2
                      label: 'Presentes\nClimáticos',
                      color: const Color.fromARGB(0, 105, 240, 175), // Color de fondo del contenedor
                      url: 'https://tageo.maps.arcgis.com/apps/instant/interactivelegend/index.html?appid=645933a6880543faaea49f323455ef54', // URL para Aplicación 2
                    ),
                    // _buildImageButton(
                    //   imagePath: 'assets/img/futuros-climaticos.png', // Ruta a la imagen para Aplicación 3
                    //   label: 'Futuros\nClimáticos',
                    //   color: const Color.fromARGB(0, 255, 82, 82), // Color de fondo del contenedor
                    //   url: 'https://google.com', // URL para Aplicación 3
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir un contenedor alrededor de una imagen con hipervínculo
  Widget _buildImageButton({
    required String imagePath,
    required String label,
    required Color color,
    required String url,
  }) {
    return Container(
      padding: EdgeInsets.all(8), // Espaciado interno
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _launchURL(url), // Abre la URL cuando se toca la imagen
            child: Image.asset(
              imagePath,
              width: 140, // Ajusta el tamaño de la imagen
              height: 140, // Ajusta el tamaño de la imagen
            ),
          ),
          SizedBox(height: 1), // Espacio entre la imagen y el texto
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

  // Función para lanzar una URL en el navegador
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
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
        // Imagen de fondo
        Positioned.fill(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        child,
      ],
    );
  }
}
