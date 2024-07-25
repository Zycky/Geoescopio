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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
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
  _MyHomePageState createState() => _MyHomePageState();
}
const primaryColor = Color(0xFF6252DA);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF7777B6);
class _MyHomePageState extends State<MyHomePage> {
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
            appBar: isSmallScreen ? AppBar(
              title: Text('SideBarX Example'),
              leading: IconButton(
                onPressed: (){
                  _key.currentState?.openDrawer();
                },
                icon: Icon(Icons.menu),
              ),
            ): null,
            drawer: SideBarXExample(controller: _controller,),
            body: Row(
              children: [
                if(!isSmallScreen) SideBarXExample(controller: _controller),
                Expanded(child: Center(child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context,child){
                    switch(_controller.selectedIndex){
                      case 0: _key.currentState?.closeDrawer();
                      return Center(
                        child: Text('Home',style: TextStyle(color: Colors.white,fontSize: 40),),
                      );
                      case 1: _key.currentState?.closeDrawer();
                      return Center(
                        child: Text('Search',style: TextStyle(color: Colors.white,fontSize: 40),),
                      );
                      case 2: _key.currentState?.closeDrawer();
                      return Center(
                        child: Text('Settings',style: TextStyle(color: Colors.white,fontSize: 40),),
                      );
                      case 3: _key.currentState?.closeDrawer();
                      return Center(
                        child: Text('Theme',style: TextStyle(color: Colors.white,fontSize: 40),),
                      );
                      default:
                        return Center(
                          child: Text('Home',style: TextStyle(color: Colors.white,fontSize: 40),),
                        );
                    }
                  },
                ),))
              ],
            )
          );
        }
      ),
    );
  }
}
class SideBarXExample extends StatelessWidget {
  const SideBarXExample({Key? key, required SidebarXController controller}) : _controller = controller, super(key: key);
  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: const SidebarXTheme(
        decoration: BoxDecoration(
            color: canvasColor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedTextStyle: const TextStyle(color: Colors.white),
      ),
      extendedTheme: const SidebarXTheme(
          width: 250
      ),
      footerDivider: Divider(color: Colors.white.withOpacity(0.8), height: 1),
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
        SidebarXItem(icon: Icons.book, label: 'About'),
        SidebarXItem(icon: Icons.face, label: 'Colaboradores'),
        SidebarXItem(icon: Icons.public, label: 'Pluriversos'),
      ],
    );
  }
}
