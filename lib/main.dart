import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'routes/home_page.dart'; 
import 'routes/acercade.dart';     
import 'routes/realizadores.dart';    
import 'routes/pluriversos.dart'; 
import 'routes/mapeaaqui.dart'; 
import 'routes/visor.dart';

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
            color: Color.fromARGB(255, 0, 0, 0),
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
const canvasColor = Color.fromARGB(255, 255, 255, 255);
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
              imagePath: 'assets/img/background.jpg', // Ruta a tu imagen
              child: Column(
                children: [
                  Expanded(
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
                                  return MapeaaquiPage(); // Muestra la página Mapea Aqui 
                                case 2:
                                  _key.currentState?.closeDrawer();
                                  return AcercadePage(); // Muestra la página Acerca de
                                case 3:
                                  _key.currentState?.closeDrawer();
                                  return PluriversosPage(); // Muestra la página Pluriversos
                                case 4:
                                  _key.currentState?.closeDrawer();
                                  return RealizadoresPage(); // Muestra la página Realizadores
                                case 5:
                                  _key.currentState?.closeDrawer();
                                  return VisorPage(); // Muestra la página Realizadores  
                                default:
                                  return HomePage(); // Página predeterminada
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SideBarXExample extends StatelessWidget {
  const SideBarXExample({super.key, required SidebarXController controller})
      : _controller = controller;
  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: const SidebarXTheme(
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 30, 23, 23),
        ),
        selectedTextStyle: TextStyle(color: Color.fromARGB(255, 103, 36, 36)),
      ),
      extendedTheme: const SidebarXTheme(width: 250),
      footerDivider:
          Divider(color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8), height: 1),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 250,
          child: Center(
            
              child: Image.asset(
                'assets/img/pluriverso2.png',
                width: 250,
                height: 250,
                
              ),
            
          ),
        );
      },
      items: const [
        SidebarXItem(icon: Icons.home, label: 'Inicio'),
        SidebarXItem(icon: Icons.public, label: 'Mapea aqui'),
        SidebarXItem(icon: Icons.diversity_3, label: 'Acerca de'),
        SidebarXItem(icon: Icons.map, label: 'Pluriversos'),
        SidebarXItem(icon: Icons.groups, label: 'Realizadores'),
        SidebarXItem(icon: Icons.vrpano, label: 'Visores'),
      ],
    );
  }
}

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
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}
