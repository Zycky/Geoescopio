import 'package:flutter/material.dart';

class PluriversosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 5'),
      ),
      body: Center(
        child: Text(
          'Contenido de la página 5',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}