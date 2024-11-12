import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:html';
import 'dart:ui' as ui;

class VisorPage extends StatefulWidget {
  @override
  State<VisorPage> createState() => _VisorPageState();
}

class _VisorPageState extends State<VisorPage> {
  final IFrameElement _iFrameElement = IFrameElement();

  @override
  void initState() {
    super.initState();

    // Establecemos las propiedades del iframe
    _iFrameElement.style.height = '100%';
    _iFrameElement.style.width = '100%';
    _iFrameElement.src =
        'https://www.google.com/maps/d/embed?mid=1vjVoy1cUXuxGo47ZQuwFAI3K__hgAwk&ehbc=2E312F/';
    _iFrameElement.style.border = 'none';

    // Registro del iframe en la plataforma
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iFrameElement,
    );
  }

  // Widget para mostrar el iframe
  final Widget _iframeWidget = HtmlElementView(
    viewType: 'iframeElement',
    key: UniqueKey(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Esto ajustará la interfaz si el teclado aparece
      appBar: AppBar(
        title: Text('Visor del Mapa'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Aseguramos que el iframe ocupe el tamaño adecuado
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.9, // Ajuste de altura
              child: _iframeWidget,
            ),
          ],
        ),
      ),
    );
  }
}
