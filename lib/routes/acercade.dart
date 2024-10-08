import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AcercadePage extends StatelessWidget {
  // Método para abrir una URL
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Fila de imágenes con detección de clic
              SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _showImageDialog(context, 'assets/img/pluriverso2.png'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset(
                        'assets/img/pluriverso2.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                ),
              ),
              Text(
                'Pluriversos Climáticos - Proyecto Anillos',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
                width: 150,
                child: Divider(
                  color: Color.fromARGB(255, 8, 95, 33),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'El proyecto ANID ANILLOS ATE 230072 “Pluriversos Climáticos: Una perspectiva decolonial en las Geohumanidades para diseñar territorios alternativos en contextos de cambio climático” es una investigación teórico-práctica que propone profundizar en las transformaciones que han generado los impactos del cambio climático en las prácticas comunitarias de localidades afectadas por fenómenos como la sequía o disminución de recursos hídricos. Con la finalidad de construir perspectivas alternativas a los actuales puntos de debate sobre cambio climático, el proyecto establece diálogos entre un trabajo científico (inter – transdisciplinario) y los saberes ambientales situados de comunidades atravesadas por transformaciones climáticas, respetando así sus prácticas bioculturales y sociohistóricas.',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 2.5,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => _launchURL('https://pluriversosclimaticos.cl'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Cambia el color del botón aquí
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            ), // Reemplaza con la URL deseada
                child: Text('Visita pluriversos')
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función para mostrar el diálogo con la imagen ampliada
  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Image.asset(imagePath),
        );
      },
    );
  }
}
