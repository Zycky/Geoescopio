import 'package:flutter/material.dart';

class ImageData {
  final String image;
  final String title;
  final String description;

  ImageData({
    required this.image,
    required this.title,
    required this.description,
  });
}



class ColaboradoresPage extends StatelessWidget {
  const ColaboradoresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Colaboradores")),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView.builder(
            itemCount: _images.length,
            itemBuilder: (BuildContext context, int index) {
              final imageData = _images[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SecondPage(heroTag: index)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: index,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imageData.image,
                            width: 200,
                            fit: BoxFit.cover, // Ajusta la imagen para que se ajuste correctamente al contenedor
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              imageData.title,
                              style: Theme.of(context).textTheme.headlineLarge, // Ajusta el estilo del título
                            ),
                            const SizedBox(height: 4),
                            Text(
                              imageData.description,
                              style: Theme.of(context).textTheme.bodyMedium, // Ajusta el estilo de la descripción
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
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final int heroTag;

  const SecondPage({super.key, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    final imageData = _images[heroTag];
    return Scaffold(
      appBar: AppBar(title: const Text("Colaboradores")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageData.image,
                    fit: BoxFit.cover, // Ajusta la imagen para que se ajuste correctamente al contenedor
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  imageData.title,
                  style: Theme.of(context).textTheme.headlineLarge, // Ajusta el estilo del título en la página de detalles
                ),
                const SizedBox(height: 8),
                Text(
                  imageData.description,
                  style: Theme.of(context).textTheme.bodyMedium, // Ajusta el estilo de la descripción en la página de detalles
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<ImageData> _images = [
  ImageData( //
    image: 'assets/img/pablo.jpg',
    title: 'Pablo Mansilla',
    description: '...',
  ),
   ///Agregar mas colaboradores aca

 
];