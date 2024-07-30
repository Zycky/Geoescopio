import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'routes/home_page.dart'; // Importa la página principal
import 'routes/about.dart';     // Importa la nueva página 1
import 'routes/colaboradores.dart';     // Importa la nueva página 2
import 'routes/pluriversos.dart'; 
import 'routes/proyecto.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Geoescopio',
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  MyHomePageState createState() => MyHomePageState();
}

const primaryColor = Color.fromARGB(255, 0, 0, 0);
const canvasColor = Color.fromARGB(255, 43, 102, 35);
const scaffoldBackgroundColor = Color.fromARGB(0, 255, 255, 255);

class MyHomePageState extends State<MyHomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    title: Text('Geoescopio'),
                    leading: IconButton(
                      onPressed: () {
                        _key.currentState?.openDrawer();
                      },
                      icon: Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: SideBarXExample(controller: _controller),
            body: BackgroundImage(
              imagePath: '/img/background.jpg', // Ruta a tu imagen
              child: Row(
                children: [
                  if (!isSmallScreen) SideBarXExample(controller: _controller),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        switch (_controller.selectedIndex) {
                          case 0:
                            _key.currentState?.closeDrawer();
                            return HomePage(); // Muestra la página principal
                          case 1:
                            _key.currentState?.closeDrawer();
                            return AboutPage(); // Muestra la página About
                          case 2:
                            _key.currentState?.closeDrawer();
                            return ColaboradoresPage(); // Muestra la página Colaboradores
                          case 3:
                            _key.currentState?.closeDrawer();
                            return PluriversosPage(); // Muestra la página Pluriversos
                          case 4:
                            _key.currentState?.closeDrawer();
                            return ProyectoPage(); // Muestra la página Proyectos
                          default:
                            return HomePage(); // Página predeterminada
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: primaryColor,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'Pluriversos Climáticos 2024',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({Key? key, required SidebarXController controller})
      : _controller = controller,
        super(key: key);
  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: const SidebarXTheme(
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedTextStyle: const TextStyle(color: Colors.white),
      ),
      extendedTheme: const SidebarXTheme(width: 250),
      footerDivider:
          Divider(color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8), height: 1),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 140,
          child: Center(
            child: ClipOval(
              child: Image.asset(
                '/img/pluriverso.png',
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      items: const [
        SidebarXItem(icon: Icons.home, label: 'Inicio'),
        SidebarXItem(icon: Icons.diversity_3, label: 'About'),
        SidebarXItem(icon: Icons.face, label: 'Colaboradores'),
        SidebarXItem(icon: Icons.public, label: 'Pluriversos'),
        SidebarXItem(icon: Icons.wysiwyg, label: 'Proyectos'),
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final Widget child;
  final String imagePath;

  const BackgroundImage({
    Key? key,
    required this.child,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}
