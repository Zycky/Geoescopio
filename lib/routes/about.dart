import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
      ),
      body: Center(
        child: Text(
          'Contenido de la página 2',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}