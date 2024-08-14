import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class PageData {
  final String? title;
  final IconData? icon;
  final Color bgColor;
  final Color textColor;
  final String? videoUrl; // URL del video de YouTube
  final String? imageUrl; // URL de la imagen

  const PageData({
    this.title,
    this.icon,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
    this.videoUrl,
    this.imageUrl,
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
          child: Icon(
            Icons.navigate_next,
            size: screenWidth * 0.1,
          ),
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
    icon: Icons.arrow_forward,
    title: "Pluriversos",
    bgColor: Color.fromARGB(255, 255, 255, 255),
    textColor: Color.fromARGB(255, 0, 0, 0),
    videoUrl: "https://www.youtube.com/watch?v=VIDEO_ID1",
    imageUrl: "https://example.com/image1.jpg",
  ),
  const PageData(
    icon: Icons.arrow_forward,
    title: "...",
    bgColor: Color.fromARGB(255, 173, 173, 173),
    textColor: Color.fromARGB(255, 0, 0, 0),
    videoUrl: "https://www.youtube.com/watch?v=VIDEO_ID2",
    imageUrl: "https://example.com/image2.jpg",
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
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: page.textColor,
            ),
            child: page.imageUrl != null
                ? Image.network(
                    page.imageUrl!,
                    width: screenHeight * 0.1,
                    height: screenHeight * 0.1,
                    fit: BoxFit.cover,
                  )
                : Icon(
                    page.icon,
                    size: screenHeight * 0.1,
                    color: page.bgColor,
                  ),
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
