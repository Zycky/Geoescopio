import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class PageData {
  final String? title;
 
  final Color bgColor;
  final Color textColor;
  final String? videoUrl; // URL del video de YouTube
  final String? imagePath; // URL de la imagen

  const PageData({
    this.title,
    this.bgColor = Colors.white,
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
        // enable itemcount to disable infinite scroll
        // itemCount: pages.length,
        // opacityFactor: 1.0,
        // scaleFactor: 0.1,
        verticalPosition: 0.7,
        // direction: Axis.vertical,
        // itemCount: pages.length,
        //physics: NeverScrollableScrollPhysics(),
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
    bgColor: Color.fromARGB(255, 255, 255, 255),
    textColor: Color.fromARGB(255, 0, 0, 0),
    videoUrl: "https://www.youtube.com/watch?v=gk_oLd69c8Q&t=6s",
    imagePath: "assets/img/iniciativas_regenerativas.png",
  ),
  const PageData(
    
    title: "Pequeñas manos y pequeñas lombrices mejoran el clima.",
    bgColor: Color.fromARGB(255, 255, 255, 255),
    textColor: Color.fromARGB(255, 0, 0, 0),
    videoUrl: "https://www.youtube.com/watch?v=BIV5jstmObw&t=4s",
    imagePath: "assets/img/pequeñas_manos_pequeñas_lombrices.png",
  ),
  // Añadir más páginas según sea necesario
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
    final screenHeight = MediaQuery.of(context).size.height;
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
            padding: const EdgeInsets.all(50.0),
            margin: const EdgeInsets.all(50.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: page.textColor,
            ),
            child: page.imagePath != null
                ? Image.network(
                    page.imagePath!,
                    width: screenHeight * 0.3,
                    height: screenHeight * 0.3,
                    fit: BoxFit.cover,
                  )
                    : SizedBox.shrink(), // Añadir un widget de sustitución si no hay imagePath
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
