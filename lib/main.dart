import 'package:flutter/material.dart';
import 'routes/home_page.dart'; // Importa la página principal
import 'routes/about.dart';     // Importa la nueva página 1
import 'routes/colaboradores.dart';     // Importa la nueva página 2
import 'routes/pluriversos.dart'; 
import 'routes/proyecto.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App con Sidebar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(), // Usa un nuevo widget MainScreen como la pantalla principal
      routes: {
        '/about': (context) => AboutPage(),
        '/colaboradores': (context) => ColaboradoresPage(),
        '/proyecto': (context) => ProyectoPage(),
        '/pluriversos': (context) => PluriversosPage(),
        
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  String _currentPage = '/'; // Ruta inicial

  void _selectPage(String route) {
    setState(() {
      _currentPage = route;
    });
    Navigator.of(context).pop(); // Cierra el Drawer después de navegar a una nueva página
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage; // Widget para la página actual

    switch (_currentPage) {
      case '/':
        currentPage = HomePage(); // Página principal
        break;
      case '/about':
        currentPage = AboutPage(); // Página Acerca de
        break;
      case '/colaboradores':
        currentPage = ColaboradoresPage(); // Página de Colaboradores
        break;
      case '/proyecto':
        currentPage = ProyectoPage(); // Página de Proyecto
        break;
      default:
        currentPage = HomePage(); // Por defecto, mostrar la página principal
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('App con Sidebar'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Inicio'),
              onTap: () {
                _selectPage('/');
              },
            ),
            ListTile(
              title: Text('Acerca de'),
              onTap: () {
                _selectPage('/about');
              },
            ),
            ListTile(
              title: Text('Colaboradores'),
              onTap: () {
                _selectPage('/colaboradores');
              },
            ),
            ListTile(
              title: Text('Proyecto'),
              onTap: () {
                _selectPage('/proyecto');
              },
            ),
          ],
        ),
      ),
      body: currentPage, // Mostrar la página actual seleccionada
    );
  }
}