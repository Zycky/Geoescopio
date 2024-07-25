import 'package:flutter/material.dart';

class ProyectoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 4'),
      ),
      body: Center(
        child: Text(
          'Contenido de la página 4',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}