import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PageData {
  final String? title;
  final Color bgColor;
  final Color textColor;
  final String? videoUrl; // URL del video de YouTube
  final String? imagePath; // Ruta de la imagen

  const PageData({
    this.title,
    this.bgColor = const Color.fromARGB(95, 154, 19, 167),
    this.textColor = Colors.black,
    this.videoUrl,
    this.imagePath,
  });
}

class PluriversosPage extends StatelessWidget {
  const PluriversosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(
        colors: pages.map((p) => p.bgColor).toList(),
        radius: screenWidth * 0.1,
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 1), // visual center
        ),
        verticalPosition: 0.7,
        itemBuilder: (index) {
          final page = pages[index % pages.length];
          return SafeArea(
            child: _Page(page: page),
          );
        },
      ),
    );
  }
}

final pages = [
  const PageData(
    title: "Colaboración en Iniciativas Regenerativas.",
    bgColor: Color.fromARGB(95, 154, 19, 167),
    textColor: Color.fromARGB(255, 0, 0, 0),
    videoUrl: "https://www.youtube.com/watch?v=gk_oLd69c8Q&t",
    imagePath: "assets/img/iniciativas_regenerativas.png",
  ),
  const PageData(
    title: "Pequeñas manos y pequeñas lombrices mejoran el clima.",
    bgColor: Color.fromARGB(95, 154, 19, 167),
    textColor: Color.fromARGB(255, 0, 0, 0),
    videoUrl: "https://www.youtube.com/watch?v=BIV5jstmObw&t",
    imagePath: "assets/img/pequeñas_manos_pequeñas_lombrices.png",
  ),
  const PageData(
    title: "Exploración sonora en el río la Ligua",
    bgColor: Color.fromARGB(95, 154, 19, 167),
    textColor: Color.fromARGB(255, 0, 0, 0),
    videoUrl: "https://www.youtube.com/watch?v=989l91b9B5I",
    imagePath: "assets/img/exploracionsonora.png",
  ),
  const PageData(
    title: "¿Conoces el camino con más curvas del mundo?",
    bgColor: Color.fromARGB(95, 154, 19, 167),
    textColor: Color.fromARGB(255, 0, 0, 0),
    videoUrl: "https://www.youtube.com/shorts/ryhnaBKQicc?feature=share",
    imagePath: "assets/img/caminocurvas.png",
  ),
  const PageData(
    title: "Sabiduría Aymara: Alimentación y Cambio Climático",
    bgColor: Color.fromARGB(95, 154, 19, 167),
    textColor: Color.fromARGB(255, 0, 0, 0),
    videoUrl: "https://www.youtube.com/watch?v=kP0YO_J2wYI",
    imagePath: "assets/img/sabiduria aymara.png",
  ),
];

class _Page extends StatelessWidget {
  final PageData page;

  const _Page({required this.page});

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define a threshold width for detecting large screens (e.g., PC)
    final isLargeScreen = screenWidth > 600; // Adjust this threshold as needed

    // Calculate the size of the image based on the screen size
    final imageSize = isLargeScreen ? screenWidth * 0.3 : screenWidth * 0.6;

    return GestureDetector(
      onTap: () {
        if (page.videoUrl != null) {
          _launchURL(page.videoUrl!);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth * 0.03), // Adjust padding
            margin: EdgeInsets.all(screenWidth * 0.03), // Adjust margin
            child: page.imagePath != null
                ? SizedBox(
                    width: imageSize,
                    height: imageSize,
                    child: Image.asset(
                      page.imagePath!,
                      fit: BoxFit.cover,
                    ),
                  )
                : SizedBox.shrink(), // Placeholder if no imagePath
          ),
          Text(
            page.title ?? "",
            style: TextStyle(
              color: page.textColor,
              fontSize: screenHeight * 0.035,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
